#!/bin/bash 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~~~~ Installation des bases de données des portails Joomla Multi-sites"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#parametres administrateur
DBUSER="user"
DBPASSWD="password"

#Dump des portails
DB="schema"
echo "~~~~ Creation de la base "$DB
mysql -u$DBUSER -p$DBPASSWD -e "CREATE DATABASE IF NOT EXISTS "$DB" DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci"

echo "~~~~ Insertion du schema "$DB
mysql -u$DBUSER -p$DBPASSWD $DB < dump.sql

echo "~~~~ Suppression puis création des users, ajout des droits par table et des droits database"
#Creation des users
while IFS=';' read nom_site
do
	echo $nom_site", "
	mysql -u$DBUSER -p$DBPASSWD -e "drop user '"$nom_site"'@localhost" > /dev/null 2>&1
    mysql -u$DBUSER -p$DBPASSWD -e "drop user '"$nom_site"'@'%'" > /dev/null 2>&1
	mysql -u$DBUSER -p$DBPASSWD -e "CREATE USER '"$nom_site"'@'localhost' IDENTIFIED BY '"$nom_site"suffixePWD'"
	mysql -u$DBUSER -p$DBPASSWD -e "CREATE USER '"$nom_site"'@'%' IDENTIFIED BY '"$nom_site"suffixePWD'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_action_log_config TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_action_logs TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_action_logs_extensions TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_action_logs_users TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_assets TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_associations TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_banner_clients TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_banner_tracks TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_banners TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_bannedip TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_failedlogin TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_unblock TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_unblock_token TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_whitelist TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_categories TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_contact_details TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_content TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_content_frontpage TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_content_rating TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_content_types TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_contentitem_tag_map TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_core_log_searches TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_extensions TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_fields TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_fields_categories TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_fields_groups TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_fields_values TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_filters TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms0 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms1 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms2 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms3 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms4 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms5 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms6 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms7 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms8 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms9 TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsa TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsb TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsc TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsd TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termse TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsf TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_taxonomy TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_taxonomy_map TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_terms TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_terms_common TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_tokens TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_tokens_aggregate TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_types TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_languages TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_menu TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_menu_types TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_messages TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_messages_cfg TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_modules TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_modules_menu TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_newsfeeds TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_osmap_items_settings TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_osmap_sitemap_menus TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_osmap_sitemaps TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_overrider TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_postinstall_messages TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_privacy_consents TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_privacy_requests TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_redirect_links TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_schemas TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_session TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_tags TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_template_styles TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_ucm_base TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_ucm_content TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_ucm_history TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_update_sites TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_update_sites_extensions TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_updates TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_user_keys TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_user_notes TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_user_profiles TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_user_usergroup_map TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_usergroups TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_users TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_utf8_conversion TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_viewlevels TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_wf_profiles TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_action_log_config TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_action_logs TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_action_logs_extensions TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_action_logs_users TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_assets TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_associations TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_banner_clients TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_banner_tracks TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_banners TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_bannedip TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_failedlogin TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_unblock TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_unblock_token TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_bfstop_whitelist TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_categories TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_contact_details TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_content TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_content_frontpage TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_content_rating TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_content_types TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_contentitem_tag_map TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_core_log_searches TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_extensions TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_fields TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_fields_categories TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_fields_groups TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_fields_values TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_filters TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms0 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms1 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms2 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms3 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms4 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms5 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms6 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms7 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms8 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_terms9 TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsa TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsb TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsc TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsd TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termse TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_links_termsf TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_taxonomy TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_taxonomy_map TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_terms TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_terms_common TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_tokens TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_tokens_aggregate TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_finder_types TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_languages TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_menu TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_menu_types TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_messages TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_messages_cfg TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_modules TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_modules_menu TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_newsfeeds TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_osmap_items_settings TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_osmap_sitemap_menus TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_osmap_sitemaps TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_overrider TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_postinstall_messages TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_privacy_consents TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_privacy_requests TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_redirect_links TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_schemas TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_session TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_tags TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_template_styles TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_ucm_base TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_ucm_content TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_ucm_history TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_update_sites TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_update_sites_extensions TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_updates TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_user_keys TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_user_notes TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_user_profiles TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_user_usergroup_map TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_usergroups TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_users TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_utf8_conversion TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_viewlevels TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON "$DB".pf_"$nom_site"_wf_profiles TO '"$nom_site"'@'%'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT LOCK TABLES ON "$DB".* TO '"$nom_site"'@'localhost'"
	mysql -u$DBUSER -p$DBPASSWD -e "GRANT LOCK TABLES ON "$DB".* TO '"$nom_site"'@'%'"
done < listeSitesBDD.csv
echo " Mise a jour des privileges"
mysql -u$DBUSER -p$DBPASSWD -e "flush privileges"
echo " Fin du script"
exit 0

