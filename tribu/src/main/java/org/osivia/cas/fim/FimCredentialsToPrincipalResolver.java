package org.osivia.cas.fim;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jasig.cas.authentication.Credential;
import org.jasig.cas.authentication.principal.Principal;
import org.jasig.cas.authentication.principal.PrincipalResolver;
import org.jasig.cas.authentication.principal.SimplePrincipal;
import org.ldaptive.Connection;
import org.ldaptive.ConnectionFactory;
import org.ldaptive.LdapEntry;
import org.ldaptive.SearchOperation;
import org.ldaptive.SearchRequest;
import org.ldaptive.SearchResult;

public class FimCredentialsToPrincipalResolver implements PrincipalResolver {

	private final Log logger = LogFactory.getLog("fim");

	private ConnectionFactory connectionFactory;

	public FimCredentialsToPrincipalResolver(ConnectionFactory connectionFactory) {
		this.connectionFactory = connectionFactory;

	}

	public Principal resolve(Credential credential) {

		FimCredentials fimCredentials = (FimCredentials) credential;
		String principalId = fimCredentials.getId(); // par défaut, le ctemail est toujours transmis.

		try {

			if (fimCredentials.getHashNumen() != null) {

				Connection conn = connectionFactory.getConnection();

				try {
					conn.open();
					SearchOperation search = new SearchOperation(conn);
					SearchResult result = search.execute(new SearchRequest("ou=users,dc=osivia,dc=org",
							"(portalPersonHashNumen=" + fimCredentials.getHashNumen() + ")", "uid")).getResult();
					result.getEntry();

					if (result.size() == 1) {

						// Si trouvé, l'uid du LDAP sera utilisé
						LdapEntry entry = result.getEntry();
						principalId = entry.getAttribute("uid").getStringValue();

						logger.info("auth via hashnumen " + fimCredentials.getHashNumen() + " (" + principalId + ")");

					} else if (result.size() > 1) {

						for (LdapEntry entry : result.getEntries()) { // if you're expecting multiple entries
							logger.error("auth impossible via hashnumen " + fimCredentials.getHashNumen() + " (trouvé "
									+ entry.getAttribute("uid").getStringValue() + ")");
						}

						// erreur ici
					} else {
//
//					// Sinon, pour des anciens comptes, on regarde si le ctemail a déjà servi sur tribu

						result = search.execute(new SearchRequest("ou=users,dc=osivia,dc=org",
								"(uid=" + fimCredentials.getId() + ")", "uid")).getResult();

						// Si aucun compte n'est trouvé, le mail académique sert de premier login
						if (result.size() == 0) {
							if (fimCredentials.getMailAca() != null) {
								principalId = fimCredentials.getMailAca();
								logger.info("auth via mailaca " + fimCredentials.getMailAca() + " (nouveau compte)");

							} else {
								logger.info("auth via ctemail " + principalId + " (nouveau compte)");

							}
						} else {

							logger.error("auth via ctemail " + principalId + " (compte existant)");

						}
					}

				} finally {
					conn.close();
				}

			}

			if (principalId == null) {
				return null;
			} else {

				// Login toujours en minuscule (compatibilité entre comptes manuels et comptes
				// FIM).
				principalId = principalId.toLowerCase();
			}
		} catch (Exception e) {

			String fullStackTrace = org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e);

			logger.error(fullStackTrace);
		}

		final Map<String, Object> convertedAttributes = new HashMap<String, Object>();

		convertedAttributes.putAll(fimCredentials.getAttributes());
		return new SimplePrincipal(principalId, convertedAttributes);
	}

	public boolean supports(Credential credential) {
		return credential instanceof FimCredentials;
	}

}
