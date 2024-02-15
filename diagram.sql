 CREATE DATABASE db_aa534f_pavlofo95;

USE db_aa534f_pavlofo95;
--1 верх 1 беж
CREATE TABLE ipblocks (
[ipb_id] INT,
[ipb_address] VARCHAR(255), 
[ipb_user] INT, 
[ipb_by] INT,
[ipb_by_text] VARCHAR(255), 
[ipb_reason] VARCHAR(255), 
[ipb_timestamp] DATETIME, 
[ipb_auto] TINYINT, 
[ipb_anon_only] TINYINT, 
[ipb_create_account] VARCHAR(255), 
[ipb_enable_autoblock] TINYINT, 
[ipb_expiry] VARCHAR(255), 
[ipb_range_start] VARCHAR(255), 
[ipb_range_end] VARCHAR(255),
[ipb_deleted] TINYINT,
[ipb_btock_email] TINYINT, 
[ipb_allow_usertalk] TINYINT
);
--ipblocks->user 1
SELECT * FROM  [ipblocks];
INSERT INTO ipblocks ([ipb_address], [ipb_by_text], [ipb_reason], [ipb_timestamp], [ipb_expiry], [ipb_deleted])
VALUES 
('192.168.0.1', 'Admin', 'Spam', '2023-02-11', '2024-02-11', 0),
('10.0.0.5', 'Moderator', 'Error', '2023-01-15', '2023-01-20', 0);
DROP TABLE ipblocks; 

--2- верх 1 зелен
CREATE TABLE [user] (
[user_id] INT PRIMARY KEY,
[user_name] VARCHAR(255), 
[user_real_name] VARCHAR(255), 
[user_password] VARCHAR(255), 
[user_newpassword] VARCHAR(255), 
[user_newpass_time] DATETIME,
[user_email] NVARCHAR(255),  
[user_touched] VARCHAR(255), 
[user_token] VARCHAR(255), 
[user_email_authenticated] DATETIME,
[user_email_token] VARCHAR(255),
[user_email_token_expires] DATETIME,
[user_registration] DATETIME,
[user_editcount] INT, 
INDEX i_name ([user_name]),
INDEX i_email([user_email])
);
INSERT INTO [user] ([user_id], [user_name], [user_real_name], [user_email], [user_registration], [user_editcount])
VALUES 
(1,'JohnDoe', 'John Doe', 'john@example.com', '2023-01-01', 25),
(2, 'JaneSmith', 'Jane Smith', 'jane@example.com', '2023-02-05', 50);
SELECT * FROM [user];
DROP TABLE [user]; 
--3
CREATE TABLE watchlist (
[wl_user] INT PRIMARY KEY,
[wl_namespace] INT, 
[wl_title] VARCHAR(255), 
[wl_notificationtimestamp] DATETIME	
);
INSERT INTO [watchlist] ([wl_user],[wl_namespace],[wl_title],[wl_notificationtimestamp])
VALUES 
(1,0, 'Main_Page', '2023-02-10 08:00:00'),
(2,2, 'Talk:Page_Title', '2023-02-09 15:30:00');
SELECT * FROM [watchlist];
DROP TABLE watchlist;
--4
CREATE TABLE user_groups (
[ug_user] INT PRIMARY KEY,
[user_group] VARCHAR(255)
);
INSERT INTO user_groups ([ug_user], [user_group])
VALUES 
(1, 'Admin'),
(2, 'Moderator');
SELECT * FROM [user_groups];
DROP TABLE user_groups;
--5
CREATE TABLE user_former_groups (
[ufg_user] INT,
[ufg_group] VARBINARY(16)
);
SELECT * FROM [user_former_groups];
--DROP TABLE user_former_groups;
--6
CREATE TABLE external_user (
[eu_local_id] INT,
[eu_external_id] VARCHAR(255)
);
SELECT * FROM [external_user];
INSERT INTO external_user ([eu_local_id], [eu_external_id])
VALUES 
(123, 'ext-1'),
(456, 'ext-2');
--DROP TABLE external_user;
--7
CREATE TABLE user_properties (
[up_user] INT PRIMARY KEY,
[up_property] VARBINARY(255),
[up_value] VARBINARY(MAX)
);
SELECT * FROM user_properties;

--DROP TABLE user_properties;
--8
CREATE TABLE user_newtalk (
[user_id] INT PRIMARY KEY,
[user_ip] VARBINARY(40), 
[user_last_timestamp] BINARY(14)
);
SELECT * FROM user_newtalk;

--DROP TABLE user_newtalk;

--9 середина 1 беж 
CREATE TABLE site_stats (
[ss_row_id] INT,
[ss_total_views] BIGINT,
[ss_total_edits] BIGINT,
[ss_good_articles] BIGINT,
[ss_total_pages] BIGINT,
[ss_users] BIGINT,
[ss_actrve_users] BIGINT,
[ss admins] INT,
[ss_images] INT
);
SELECT * FROM  [site_stats];

--DROP TABLE site_stats;

--10
CREATE TABLE logging (
[log_id] INT PRIMARY KEY,
[log_type] VARBINARY(32),
[log_action] VARBINARY(32), 
[log_timestamp] BINARY(14),
[log_user] INT,
[log_user_text] VARCHAR(255),
[log_namespace] INT,
[log_title] VARCHAR(255),
[log_page] INT,
[log_comment] VARCHAR(255),
[log_params]  VARBINARY(MAX),
[log_deleted] TINYINT
);
SELECT * FROM [logging];
DROP TABLE logging;
--logging->user 2
--11
CREATE TABLE log_search (
[is_field] VARBINARY(32),
[is_value] VARCHAR(255),
[is_log_id] INT PRIMARY KEY
);
SELECT * FROM  [log_search];
DROP TABLE log_search;
--log_search->logging
--12
CREATE TABLE hitcounter (
[hc_id] INT PRIMARY KEY, 
);
SELECT * FROM [hitcounter];
--DROP TABLE hitcounter;


--13 середина 1_2 роз
CREATE TABLE filearchive (
[fa_id] INT,
[fa_name] VARCHAR(255),
[fa_archrve_name] VARCHAR(255),
[fa_storage_group] VARBINARY(16), 
[fa_storage_key] VARBINARY(64),
[fa_deleted_user] INT,
[fa_deleted_timestamp] BINARY(14),
[fa_deleted_reason] TEXT,
[fa_size] INT,
[fa_width] INT,
[fa_height] INT,
[fa_metadata] VARBINARY(MAX),
[fa_bits] INT,
[fa_media_type] VARCHAR(255),
[fa_major_mime] VARCHAR(255),
[fa_minor_mime] VARBINARY(100),
[fa_descriptton] VARCHAR(255),
[fa_user] INT,
[fa_user_text] VARCHAR(255),
[fa_timestamp] BINARY(14),
[fa deleted] TINYINT
);
SELECT * FROM  [filearchive];

-- filearchive -> userX
--14
CREATE TABLE [image] (
[img_name] VARCHAR(255) PRIMARY KEY,
[img_size] INT,
[img_width] INT,
[img_height] INT,
[img_metadata] VARBINARY(MAX),
[img_bits] INT,
[img_media_type] VARCHAR(255), 
[img_major_mime] VARCHAR(255),
[img_minor_mime] VARBINARY(100), 
[img_description] VARCHAR(255),
[img_user] INT,
[img_userjext] VARCHAR(255),
[img_timestamp] VARBINARY(14), 
[img_sha1] VARBINARY(32)
);
SELECT * FROM [image];
--DROP TABLE[image];
--15
CREATE TABLE oldimage (
[oi_name] VARCHAR(255),
[oi_archive_name] VARCHAR(255),
[oi_size] INT,
[oi_width] INT, 
[oi_height] INT,
[oi_bits] INT,
[oi_description] VARCHAR(255),
[oi_user] INT,
[oi_user_text]VARCHAR(255),
[oi_timestamp] BINARY(14),
[oi_metadata]  VARBINARY(MAX),
[oi_media_type] VARCHAR(255),
[oi_major_mime] VARCHAR(255),
[oi_minor_mime] VARBINARY (100),
[oi_deleted] TINYINT,
[oi_sha1] VARBINARY(32) 
);
SELECT * FROM  [oldimage];
--DROP TABLE oldimage;

--16
CREATE TABLE uploadstash (
[us_id] INT, 
[us_user] INT,
[us_key] VARCHAR(255),
[us_orig_path] VARCHAR(255),
[us_path] VARCHAR(255),
[us_source type] VARCHAR(50), 
[us_timestamp] VARBINARY(14),
[us_status] VARCHAR(50),
[us_size] INT,
[us_sha1] VARCHAR(31),
[us_mime] VARCHAR(255),
[us_media_type] VARCHAR(255),
[us_image_width] INT, 
[us_image_height] INT, 
[us_image_bits] SMALLINT
);
SELECT * FROM [oldimage];
--17
CREATE TABLE imagelinks(
[il_from] INT,
[il_to] VARCHAR(255) 
);
SELECT * FROM [imagelinks];

--18 низ 1 бледно-голуб
CREATE TABLE msg_resource (
[mr_resource] VARBINARY(255),
[mr_lang] VARBINARY(32),
[mr_blob] VARBINARY(MAX),
[mr_timestamp] BINARY(14)
);
SELECT * FROM [msg_resource];
--19
CREATE TABLE msg_resource_links(
[mrl_resource] VARBINARY(255), 
[mrl_message] VARBINARY(255)
);
SELECT * FROM [msg_resource_links];
--20
CREATE TABLE module_deps (
[md_module] VARBINARY(255), 
[md_skin] VARBINARY(32), 
[md_deps] VARBINARY(MAX)
);
SELECT * FROM [module_deps];



--21 середина 2 беж
CREATE TABLE revision  (
[rev_id] INT PRIMARY KEY, 
[rev_page] INT, 
[rev_text_id] INT,
[rev_comment] VARCHAR(255),
[rev_user] INT,
[rev_user_text] VARCHAR(255), 
[rev_timestamp] BINARY(14), 
[rev_minor_edit] TINYINT, 
[rev_deleted] TINYINT, 
[rev_len] INT, 
[rev_parent_id] INT,
[rev_sha1] VARBINARY(32)
);

INSERT INTO [revision] ([rev_id],[rev_user_text], [rev_comment])
VALUES
(1,'New Balance in MEGASPORT', 'nice'),
(2,'Nike Acg Gore-Tex Mountain Fly', 'new'),
(3,'Adidass Fly', 'mode');
SELECT * FROM [revision];

CREATE VIEW [Sport revision] AS 
SELECT [rev_user_text] FROM [revision];

SELECT * FROM  [Sport revision];
			
--DROP TABLE revision;

--22 
CREATE TABLE archive (
[ar_namespace] INT, 
[ar_title] VARCHAR(255), 
[ar_text] VARBINARY(MAX),
[ar_comment] VARCHAR(255),  
[ar_user] INT,
[ar_user_text] VARCHAR(255), 
[ar_timestamp] BINARY(14), 
[ar_minor_edit] TINYINT,
[ar_flags] VARCHAR(255),
[ar_rev_id] INT PRIMARY KEY,
[ar_text_id] INT,
[ar_deleted] TINYINT, 
[ar_len] INT, 
[ar_page_id] INT, 
[ar_parent_id] INT,
[ar_sha1] VARBINARY(32)
);
SELECT * FROM [archive];
--DROP TABLE [archive];
--23
CREATE TABLE [text] (
[old_id] INT PRIMARY KEY, 
[old_text] VARCHAR(MAX),
[old_flags] VARCHAR(255)
);
SELECT * FROM [text];
DROP TABLE [text];
--24
CREATE TABLE recentchanges (
[rc_id] INT PRIMARY KEY, 
[rc_timestamp] DATETIME,
[rc_cur_time] DATETIME,
[rc_user] INT,
[rc_userjext] VARCHAR(255),
[rc_namespace] INT,
[rc_title] VARCHAR(255), 
[rc_comment] VARCHAR(255),
[rc_minor] TINYINT,
[rc_bot] TINYINT,
[rc_new] TINYINT, 
[rc_cur_id] INT,
[rc_this_oldid] INT, 
[rc_last_oldid] INT, 
[rc_type] TINYINT,
[rc_moved_to_ns] TINYINT,
[rc_moved_to_title] VARCHAR(255),
[rc_patrolled] TINYINT,
[re_ip] VARCHAR(255), 
[rc_old_len] INT,
[rc_new_len] INT, 
[rc_deleted] TINYINT,
[rc_logid] INT,
[re_log_type] VARCHAR(255),
[re_log_action] VARCHAR(255),
[rc_params] VARCHAR(MAX)
);
SELECT * FROM  [recentchanges];
INSERT INTO recentchanges ([rc_id], [rc_timestamp], [rc_namespace], [rc_comment])
VALUES 
(12, '2017-10-27', 22,'real'),
(55, '2017-11-22', 55, 'natural'),
(33, '2017-11-28', 55, 'ecology');

CREATE VIEW [Comments recentchanges] AS 
SELECT [rc_timestamp], [rc_comment] FROM [recentchanges]
WHERE [rc_comment] = 'natural';
SELECT * FROM  [Comments recentchanges];

DROP TABLE recentchanges;


--25
CREATE TABLE templatelinks (
[tl_from] INT, 
[tl_namespace] INT,
[tl_title] VARCHAR(255)
);
SELECT * FROM  [templatelinks];
--26
CREATE TABLE iwlinks(
[iwl_from] INT,
[iwl_prefix] VARBINARY(20),
[iwl_title] VARCHAR(255) 
);
SELECT * FROM [templatelinks];
--27
CREATE TABLE langlinks(
[ll_from] INT, 
[ll_lang] VARBINARY(20), 
[ll_title] VARCHAR(255) 
);
SELECT * FROM [langlinks];
--28
CREATE TABLE externallinks (
[el_from] INT, 
[el_to] VARCHAR(MAX), 
[el_index] VARCHAR(MAX)
);
SELECT * FROM [externallinks];
--DROP TABLE externallinks;
--29
CREATE TABLE pagelinks (
[pl_from] INT, 
[pl_namespace] INT, 
[pl_title] VARCHAR(255)
);
SELECT * FROM [pagelinks];
--DROP TABLE pagelinks;
--30
CREATE TABLE [page](
[page_id] INT PRIMARY KEY,
[page_namespace] VARCHAR(255),
[page_title] VARCHAR(255),
[page restrictions] VARCHAR(MAX), 
[page_counter] BIGINT,
[page_is_redirect] TINYINT,
[page_is_new] TINYINT,
[page_random] FLOAT,
[page_touched] BINARY(14),
[page_latest] INT,
[page_len] INT
INDEX i_namespace([page_namespace]),
INDEX i_title([page_title])
);
INSERT INTO [page]([page_id],[page_namespace],[page_title],[page_latest],[page_is_new])
VALUES 
(1,'food', 'Apple', 22, 1),
(2,'animal', 'Rabitts', 2, 1);
SELECT * FROM [page];
DROP TABLE [page];

--31
CREATE TABLE redirect(
[rd_from] INT,
[rd_namespace] INT,
[rd_title] VARCHAR(255), 
[rd_interwiki] VARCHAR(32), 
[rd_fragment] VARCHAR(255) 
);
SELECT * FROM [redirect];
--32
CREATE TABLE page_restrictions(
[pr_page] INT, 
[pr_type] VARBINARY(60), 
[pr_level] VARBINARY(60), 
[pr_cascade] TINYINT, 
[pr_user] INT,
[pr_expiry] VARBINARY(14),
[pr_id] INT 
);
SELECT * FROM [page_restrictions];
--33
CREATE TABLE page_props(
[pp_page] INT,
[pp_propname] VARBINARY (60), 
[pp_value]  VARCHAR(MAX)
);
SELECT * FROM [page_props];

--34
CREATE TABLE protected_titles (
[pt_namespace] INT, 
[pt_title] VARCHAR(255), 
[pt_user] INT,
[pt_reason] VARCHAR(MAX), 
[pt_timestamp] BINARY(14), 
[pt_expiry] VARBINARY(14),
[pt_create_perm] VARBINARY(60) 
);
SELECT * FROM [protected_titles];
--35
CREATE TABLE category(
[cat_id] INT,
[cat_title] VARCHAR(255),
[cat_pages] INT, 
[cat_subcats] INT,
[cat_files] INT,
[cat_hidden] TINYINT 
);
SELECT * FROM [category];
--36
CREATE TABLE categorylinks (
[cl_from] INT,
[cl_to] VARCHAR(255),
[cl_sortkey] VARBINARY(230),
[cl_sortkey_prefix] VARCHAR(255) ,
[cl_timestamp] TIMESTAMP,
[cl_collation] VARBINARY(32),
[cl_type] VARCHAR(255),
);
SELECT * FROM [categorylinks];
--37
CREATE TABLE searchindex (
[si_page] INT,
[si_title] VARCHAR(255),
[si_text] TEXT 
);
SELECT * FROM [searchindex];
--DROP TABLE searchindex;

--38 низ 2 голуб
CREATE TABLE change_tag(
[ct_rc_id] INT, 
[ct_log_id] INT,
[ct_rev_id] INT,
[ct_tag] VARCHAR(255), 
[ct_params] VARCHAR(MAX)
);
SELECT * FROM [change_tag];
--39
CREATE TABLE tag_summary (
[ts_rc_id] INT,
[ts_log_id] INT,
[ts_rev_id] INT, 
[ts_tags] VARCHAR(MAX) 
);
SELECT * FROM [tag_summary];
--40
CREATE TABLE valid_tag (
[vt_tag] VARCHAR(255) 
);
SELECT * FROM  [valid_tag];

--41 верх 3 бирюз
CREATE TABLE objectcache (
[keyname] VARBINARY(255),
[value] VARCHAR(MAX), 
[exptime] DATETIME
);
SELECT * FROM [objectcache];
--42
CREATE TABLE config (
[cf_name] VARBINARY (255),
[cf_value] VARCHAR(MAX) 
);
SELECT * FROM [config];
--43
CREATE TABLE trancache (
[tc_url]  VARBINARY (255),
[tc_contents] TEXT,
[tc_time] BINARY(14) 
);
SELECT * FROM [trancache];
--44
CREATE TABLE l10n_cache (
[lc_lang] VARBINARY(32),
[lc_key] VARCHAR(255),
[lc_value] VARCHAR(MAX)
);
SELECT * FROM  [l10n_cache];
--45
CREATE TABLE querycache (
[qc_type] VARBINARY(32),
[qc_value] INT,
[qc_namespace] INT,
[qc_title] VARCHAR(255)
);
SELECT * FROM [querycache];
--46
CREATE TABLE querycache_info (
[qci_type] VARBINARY(32),  
[qci_timestamp] BINARY(14)
);
SELECT * FROM [querycache_info];
--47
CREATE TABLE querycachetwo (
[qcc_type] VARBINARY (22),
[qcc_value] INT,
[qcc_namespace] INT,
[qcc_title] VARCHAR(255),
[qcc_namespacetwo] INT,
[qcc_titlewo] VARCHAR(255)
);
SELECT * FROM [querycachetwo];

--48 верх-середина 1 розов
CREATE TABLE testitem (
[ti_run] INT PRIMARY KEY,
[ti name] VARCHAR(255),
[ti_success] BIT 
);
SELECT * FROM [testitem];
DROP TABLE testitem;
--49
CREATE TABLE testrun (
[tr_id] INT PRIMARY KEY,
[tr_date] CHAR(14),
[tr_mw_version] VARCHAR(255),
[tr_php_version] VARCHAR(255),
[tr_db_version] VARCHAR(255),
[tr_uname] VARCHAR(255)
);
SELECT * FROM [testrun];
DROP TABLE testrun;
--testitem--> testrun


--50 верх-середина 2 фиолет
CREATE TABLE trackbacks (
[tb_id] INT PRIMARY KEY,
[tb_page] INT,
[tb_title] VARCHAR(255),
[tb_url] VARCHAR(MAX),
[tb_ex] TEXT,
[tb_name] VARCHAR(255)
);
SELECT * FROM [trackbacks];
DROP TABLE trackbacks;
--51
CREATE TABLE job (
[job_W] INT,
[job_cmd] VARBINARY(60),
[job_namespace] INT,
[job title] VARCHAR (255),
[jb_params] VARCHAR(MAX)
);
SELECT * FROM [job];
--52
CREATE TABLE updatelog(
[ul key] VARCHAR(255),
[ul value] VARCHAR(MAX)
);
SELECT * FROM [updatelog];

--53
CREATE TABLE interwiki(
[iw_profic] VARCHAR (32),
[iw_uf] VARCHAR(MAX),
[iw_api] VARCHAR(MAX),
[iw_wikid] VARCHAR (64),
[iw_local] BIT,
[iw_trans] TINYINT
);
SELECT * FROM [interwiki];


ALTER TABLE ipblocks DROP CONSTRAINT fk_ipblocks_user_modified;
-- 1 Связь между таблицами user и fk_ipblocks_user
ALTER TABLE ipblocks
ADD CONSTRAINT fk_ipblocks_user_modified FOREIGN KEY (ipb_by) REFERENCES [user]([user_id]);
-- user_groups-> user

ALTER TABLE logging DROP CONSTRAINT fk_logging_user;
-- 2 Связь между таблицами logging и user
ALTER TABLE logging
ADD CONSTRAINT fk_logging_user FOREIGN KEY (log_user) REFERENCES [user]([user_id]);
-- logging -> user

ALTER TABLE [image] DROP CONSTRAINT fk_image_user;
-- 3 Связь между таблицами image и user
ALTER TABLE [image]
ADD CONSTRAINT fk_image_user FOREIGN KEY (img_user) REFERENCES [user]([user_id]);
--image -> user

ALTER TABLE oldimage DROP CONSTRAINT fk_oldimage_user;
-- 4 Связь между таблицами oldimage и user
ALTER TABLE oldimage
ADD CONSTRAINT fk_oldimage_user FOREIGN KEY (oi_user) REFERENCES [user]([user_id]);
--oldimage -> user

ALTER TABLE imagelinks DROP CONSTRAINT fk_image_imagelinks;
-- 5 Связь между таблицами image и imagelinks
ALTER TABLE imagelinks
ADD CONSTRAINT fk_image_imagelinks FOREIGN KEY ([il_to]) REFERENCES [image]([img_name]);
--imagelinks -> image

ALTER TABLE [revision] DROP CONSTRAINT fk_revision_user;
-- 6 Связь между таблицами revision и user
ALTER TABLE [revision]
ADD CONSTRAINT fk_revision_user FOREIGN KEY (rev_user) REFERENCES [user]([user_id]);
--revision -> user

ALTER TABLE [user] DROP CONSTRAINT fk_user_recentchanges;
-- 7 Связь между таблицами user и recentchanges
ALTER TABLE [user]
ADD CONSTRAINT fk_user_recentchanges FOREIGN KEY ([user_id]) REFERENCES recentchanges([rc_id]);
-- recentchanges-> user

ALTER TABLE hitcounter DROP CONSTRAINT fk_page_hitcounter;
-- 8 Связь между таблицами hitcounter и page
ALTER TABLE hitcounter
ADD CONSTRAINT fk_page_hitcounter FOREIGN KEY ([page_id]) REFERENCES [page]([page_id]);
--page -> hitcounter


ALTER TABLE revision DROP CONSTRAINT fk_revision_archive;
-- 9 Связь между таблицами archive и revision
ALTER TABLE archive
ADD CONSTRAINT fk_archive_revision FOREIGN KEY ([ar_rev_id]) REFERENCES revision ([rev_id]);
--archive -> revision


ALTER TABLE user_properties DROP CONSTRAINT fk_user_properties_user;
-- 10 Связь между таблицами user и user_properties
ALTER TABLE user_properties
ADD CONSTRAINT fk_user_properties_user FOREIGN KEY (up_user) REFERENCES [user]([user_id]);
-- user-> user_properties

ALTER TABLE user_groups DROP CONSTRAINT fk_user_group_user;
-- 11 Связь между таблицами user и user_group
ALTER TABLE user_groups
ADD CONSTRAINT fk_user_group_user FOREIGN KEY (ug_user) REFERENCES [user]([user_id]);
-- user-> user_group

ALTER TABLE user_former_groups DROP CONSTRAINT fk_user_former_groups_user;
-- 12 Связь между таблицами user и user_former_group
ALTER TABLE user_former_groups
ADD CONSTRAINT fk_user_former_groups_user FOREIGN KEY (ufg_user) REFERENCES [user]([user_id]);
-- user->user_former_group

ALTER TABLE user_newtalk DROP CONSTRAINT fk_user_newtalk_user;
-- 13 Связь между таблицами user и user_newtalk
ALTER TABLE user_newtalk
ADD CONSTRAINT fk_user_newtalk_user FOREIGN KEY ([user_id]) REFERENCES [user]([user_id]);
-- user_newtalk-> user

ALTER TABLE [watchlist] DROP CONSTRAINT fk_watchlist_user;
-- 14 Связь между таблицами user и watchlist
ALTER TABLE [watchlist] 
ADD CONSTRAINT fk_watchlist_user FOREIGN KEY (wl_user) REFERENCES [user]([user_id]);
-- watchlist-> user



ALTER TABLE [revision] DROP CONSTRAINT fk_text_revision;
-- 15 Связь между таблицами user и text
ALTER TABLE [revision]
ADD CONSTRAINT fk_text_revision FOREIGN KEY ([rev_text_id]) REFERENCES [text]([old_id]);
-- user-> text


ALTER TABLE archive DROP CONSTRAINT fk_archive_text;
-- 16 Связь между таблицами archive и text
ALTER TABLE archive
ADD CONSTRAINT fk_archive_text FOREIGN KEY ([ar_text_id]) REFERENCES [text]([old_id]);
-- archive -> text


ALTER TABLE recentchanges DROP CONSTRAINT fk_text_recentchanges;
-- 17 Связь между таблицами text и recentchanges
ALTER TABLE recentchanges
ADD CONSTRAINT fk_text_recentchanges FOREIGN KEY ([rc_user]) REFERENCES [text]([old_id]);
-- text -> recentchanges

ALTER TABLE testitem DROP CONSTRAINT fk_testitem_testrun;
-- 18 Связь между таблицами testitem и testrun
ALTER TABLE testitem 
ADD CONSTRAINT fk_testitem_testrun FOREIGN KEY (ti_run) REFERENCES testrun(tr_id);
-- testitem -> testrun

ALTER TABLE trackbacks DROP CONSTRAINT fk_trackbacks_page;
-- 19 Связь между таблицами trancache и page
ALTER TABLE trackbacks 
ADD CONSTRAINT fk_trackbacks_page FOREIGN KEY (tb_page) REFERENCES [page](page_id);
-- trackbacks -> page

ALTER TABLE templatelinks DROP CONSTRAINT fk_templatelinks_page;
-- 20 Связь между таблицами templatelinks и page
ALTER TABLE templatelinks  
ADD CONSTRAINT fk_templatelinks_page FOREIGN KEY (tl_from) REFERENCES [page](page_id);
-- templatelinks -> page

ALTER TABLE iwlinks DROP CONSTRAINT fk_iwlinks_page;
-- 21 Связь между таблицами iwlinks и page
ALTER TABLE iwlinks  
ADD CONSTRAINT fk_iwlinks_page FOREIGN KEY (iwl_from) REFERENCES [page](page_id);
-- iwlinks -> page

ALTER TABLE langlinks DROP CONSTRAINT fk_langlinks_page;
-- 22 Связь между таблицами langlinks и page
ALTER TABLE langlinks  
ADD CONSTRAINT fk_langlinks_page FOREIGN KEY (ll_from) REFERENCES [page](page_id);
-- langlinks -> page

ALTER TABLE externallinks DROP CONSTRAINT fk_externallinks_page;
-- 23 Связь между таблицами externallinks и page
ALTER TABLE externallinks 
ADD CONSTRAINT fk_externallinks_page FOREIGN KEY ([el_from]) REFERENCES [page]([page_id]);
-- externallinks -> page 

ALTER TABLE pagelinks DROP CONSTRAINT fk_pagelinks_page;
-- 24 Связь между таблицами pagelinks  и page
ALTER TABLE pagelinks  
ADD CONSTRAINT fk_pagelinks_page FOREIGN KEY ([pl_from]) REFERENCES [page]([page_id]);
-- pagelinks -> page

ALTER TABLE category DROP CONSTRAINT fk_category_page;
-- 25 Связь между таблицами category  и page
ALTER TABLE category  
ADD CONSTRAINT fk_category_page FOREIGN KEY ([cat_id]) REFERENCES [page]([page_id]);
-- category -> page

ALTER TABLE categorylinks DROP CONSTRAINT fk_categorylinks_page;
-- 26 Связь между таблицами categorylinks  и page
ALTER TABLE categorylinks  
ADD CONSTRAINT fk_categorylinks_page FOREIGN KEY ([cl_from]) REFERENCES [page]([page_id]);
-- categorylinks -> page

ALTER TABLE searchindex DROP CONSTRAINT fk_searchindex_page;
-- 27 Связь между таблицами searchindex и page
ALTER TABLE searchindex   
ADD CONSTRAINT fk_searchindex_page FOREIGN KEY ([si_page]) REFERENCES [page]([page_id]);
-- searchindex -> page

ALTER TABLE redirect DROP CONSTRAINT fk_redirect_page;
-- 28 Связь между таблицами redirect и page
ALTER TABLE redirect   
ADD CONSTRAINT fk_redirect_page FOREIGN KEY ([rd_from]) REFERENCES [page]([page_id]);
-- redirect -> page

ALTER TABLE page_restrictions DROP CONSTRAINT fk_page_restrictions_page;
-- 29 Связь между таблицами page_restrictions и page
ALTER TABLE page_restrictions   
ADD CONSTRAINT fk_page_restrictions_page FOREIGN KEY ([pr_page]) REFERENCES [page]([page_id]);
-- page_restrictions -> page

ALTER TABLE [page] DROP CONSTRAINT fk_page_recentchanges;
-- 30 Связь между таблицами page и recentchanges
ALTER TABLE [page]
ADD CONSTRAINT fk_page_recentchanges FOREIGN KEY ([page_id]) REFERENCES recentchanges([rc_id]);
-- page -> recentchanges 

ALTER TABLE log_search DROP CONSTRAINT fk_log_search_logging;
-- 30 Связь между таблицами log_search и logging
ALTER TABLE log_search
ADD CONSTRAINT fk_log_search_logging FOREIGN KEY (is_log_id) REFERENCES logging(log_id);
--log_search -> logging
