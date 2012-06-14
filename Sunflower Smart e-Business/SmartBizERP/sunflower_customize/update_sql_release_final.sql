
DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) collate utf8_bin NOT NULL default '',
  `lastname` varchar(32) collate utf8_bin NOT NULL default '',
  `company` varchar(32) collate utf8_bin NOT NULL,
  `address_1` varchar(128) collate utf8_bin NOT NULL,
  `address_2` varchar(128) collate utf8_bin NOT NULL,
  `city` varchar(128) collate utf8_bin NOT NULL,
  `postcode` varchar(10) collate utf8_bin NOT NULL,
  `country_id` int(11) NOT NULL default '0',
  `zone_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `banner` ADD `position` VARCHAR( 20 ) NOT NULL AFTER `status`;

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(11) NOT NULL auto_increment,
  `sort_order` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `small_image` varchar(255) collate utf8_unicode_ci NOT NULL,
  `big_image` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;



DROP TABLE IF EXISTS `company_description`;
CREATE TABLE IF NOT EXISTS `company_description` (
  `company_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `position` varchar(255) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `company_image`;
CREATE TABLE IF NOT EXISTS `company_image` (
  `company_image_id` int(11) NOT NULL auto_increment,
  `company_id` int(11) NOT NULL,
  `image` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`company_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `demo`;
CREATE TABLE IF NOT EXISTS `demo` (
  `demo_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) collate utf8_bin default NULL,
  `sort_order` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `image_icon` varchar(100) collate utf8_bin NOT NULL,
  `image_preview` varchar(100) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`demo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=108 ;

DROP TABLE IF EXISTS `demo_description`;
CREATE TABLE IF NOT EXISTS `demo_description` (
  `demo_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL,
  `description` text collate utf8_bin NOT NULL,
  `meta_description` varchar(255) collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`demo_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=108 ;



DROP TABLE IF EXISTS `demo_link`;
CREATE TABLE IF NOT EXISTS `demo_link` (
  `demo_link_id` int(11) NOT NULL auto_increment,
  `demo_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin default NULL,
  `url` varchar(255) collate utf8_bin default NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY  (`demo_link_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=182 ;



DROP TABLE IF EXISTS `download`;
CREATE TABLE IF NOT EXISTS `download` (
  `download_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `filename` varchar(128) collate utf8_bin NOT NULL default '',
  `movie` varchar(100) collate utf8_bin default NULL,
  `mask` varchar(128) collate utf8_bin NOT NULL,
  `download_allowed` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `sort_order` int(5) NOT NULL default '0',
  PRIMARY KEY  (`download_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;



DROP TABLE IF EXISTS `download_category`;
CREATE TABLE IF NOT EXISTS `download_category` (
  `download_category_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) collate utf8_bin default NULL,
  `parent_id` int(11) NOT NULL default '0',
  `top` int(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL default '0',
  `status` int(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`download_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=63 ;



DROP TABLE IF EXISTS `download_category_description`;
CREATE TABLE IF NOT EXISTS `download_category_description` (
  `download_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL default '',
  `description` text collate utf8_bin NOT NULL,
  `meta_description` varchar(255) collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`download_category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `download_category_to_store`;
CREATE TABLE IF NOT EXISTS `download_category_to_store` (
  `download_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`download_category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `download_description`;
CREATE TABLE IF NOT EXISTS `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) collate utf8_bin NOT NULL default '',
  `description` text collate utf8_bin,
  PRIMARY KEY  (`download_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `download_image`;
CREATE TABLE IF NOT EXISTS `download_image` (
  `download_image_id` int(11) NOT NULL auto_increment,
  `download_id` int(11) NOT NULL,
  `image` varchar(255) collate utf8_bin default NULL,
  `image_title` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`download_image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2346 ;


DROP TABLE IF EXISTS `download_to_download_category`;
CREATE TABLE IF NOT EXISTS `download_to_download_category` (
  `download_id` int(11) NOT NULL,
  `download_category_id` int(11) NOT NULL,
  PRIMARY KEY  (`download_id`,`download_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `download_to_store`;
CREATE TABLE IF NOT EXISTS `download_to_store` (
  `download_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`download_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL auto_increment,
  `sort_order` int(3) NOT NULL default '0',
  `author` varchar(64) collate utf8_bin NOT NULL default '',
  `status` int(1) NOT NULL default '1',
  `image` varchar(255) collate utf8_bin NOT NULL default '',
  `publish_start` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_end` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;


DROP TABLE IF EXISTS `news_description`;
CREATE TABLE IF NOT EXISTS `news_description` (
  `news_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(100) collate utf8_bin NOT NULL default '',
  `preview` text collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL default '',
  `meta_description` varchar(255) collate utf8_bin NOT NULL default '',
  `description` text collate utf8_bin NOT NULL,
  `related_product_url_text` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`news_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `news_post`;
CREATE TABLE IF NOT EXISTS `news_post` (
  `post_id` int(11) NOT NULL auto_increment,
  `news_id` int(11) NOT NULL,
  `author` varchar(64) collate utf8_bin NOT NULL default '',
  `text` text collate utf8_bin NOT NULL,
  `ip` varchar(100) collate utf8_bin NOT NULL default '',
  `rating` int(1) NOT NULL default '0',
  `status` int(1) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`post_id`,`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;



DROP TABLE IF EXISTS `news_related`;
CREATE TABLE IF NOT EXISTS `news_related` (
  `news_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY  (`news_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `news_view`;
CREATE TABLE IF NOT EXISTS `news_view` (
  `view_id` int(11) NOT NULL auto_increment,
  `news_id` int(11) NOT NULL,
  `ip` varchar(100) collate utf8_bin NOT NULL default '',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`view_id`,`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `news_youtube`;
CREATE TABLE IF NOT EXISTS `news_youtube` (
  `youtube_id` int(11) NOT NULL auto_increment,
  `news_id` int(11) NOT NULL,
  `v` varchar(100) collate utf8_bin NOT NULL default '',
  `width` decimal(5,0) NOT NULL default '0',
  `height` decimal(5,0) NOT NULL default '0',
  `autoplay` int(1) NOT NULL default '0',
  `title` varchar(100) collate utf8_bin NOT NULL default '',
  `preview` varchar(300) collate utf8_bin NOT NULL default '',
  `status` int(1) NOT NULL default '1',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`youtube_id`,`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `partner`;
CREATE TABLE IF NOT EXISTS `partner` (
  `partner_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) collate utf8_bin NOT NULL default '',
  `image` varchar(255) collate utf8_bin default NULL,
  `sort_order` int(3) NOT NULL,
  `url` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`partner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;

DROP TABLE IF EXISTS `partner_to_store`;
CREATE TABLE IF NOT EXISTS `partner_to_store` (
  `partner_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`partner_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `product_featured`;
CREATE TABLE IF NOT EXISTS `product_featured` (
  `product_id` int(11) NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `quick_link`;
CREATE TABLE IF NOT EXISTS `quick_link` (
  `quick_link_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `demo_url` varchar(255) collate utf8_bin NOT NULL,
  `username_password` varchar(50) collate utf8_bin NOT NULL,
  `filename` varchar(128) collate utf8_bin NOT NULL default '',
  `movie` varchar(100) collate utf8_bin default NULL,
  `mask` varchar(128) collate utf8_bin NOT NULL,
  `download_allowed` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `sort_order` int(5) NOT NULL default '0',
  PRIMARY KEY  (`quick_link_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;


DROP TABLE IF EXISTS `quick_link_category`;
CREATE TABLE IF NOT EXISTS `quick_link_category` (
  `quick_link_category_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) collate utf8_bin default NULL,
  `parent_id` int(11) NOT NULL default '0',
  `top` int(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL default '0',
  `status` int(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`quick_link_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=65 ;

DROP TABLE IF EXISTS `quick_link_category_description`;
CREATE TABLE IF NOT EXISTS `quick_link_category_description` (
  `quick_link_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL default '',
  `description` text collate utf8_bin NOT NULL,
  `meta_description` varchar(255) collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`quick_link_category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `quick_link_category_to_store`;
CREATE TABLE IF NOT EXISTS `quick_link_category_to_store` (
  `quick_link_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`quick_link_category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `quick_link_description`;
CREATE TABLE IF NOT EXISTS `quick_link_description` (
  `quick_link_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) collate utf8_bin NOT NULL default '',
  `description` text collate utf8_bin,
  PRIMARY KEY  (`quick_link_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `quick_link_image`;
CREATE TABLE IF NOT EXISTS `quick_link_image` (
  `quick_link_image_id` int(11) NOT NULL auto_increment,
  `quick_link_id` int(11) NOT NULL,
  `image` varchar(255) collate utf8_bin default NULL,
  `image_title` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`quick_link_image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2473 ;


DROP TABLE IF EXISTS `quick_link_to_quick_link_category`;
CREATE TABLE IF NOT EXISTS `quick_link_to_quick_link_category` (
  `quick_link_id` int(11) NOT NULL,
  `quick_link_category_id` int(11) NOT NULL,
  PRIMARY KEY  (`quick_link_id`,`quick_link_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `quick_link_to_store`;
CREATE TABLE IF NOT EXISTS `quick_link_to_store` (
  `quick_link_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`quick_link_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `service_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) collate utf8_bin default NULL,
  `sort_order` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `image_icon` varchar(100) collate utf8_bin NOT NULL,
  `image_preview` varchar(100) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=79 ;


DROP TABLE IF EXISTS `service_description`;
CREATE TABLE IF NOT EXISTS `service_description` (
  `service_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL,
  `description` text collate utf8_bin NOT NULL,
  `meta_description` varchar(255) collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`service_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=79 ;


DROP TABLE IF EXISTS `service_detail`;
CREATE TABLE IF NOT EXISTS `service_detail` (
  `service_detail_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) collate utf8_bin default NULL,
  `sort_order` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `image_icon` varchar(100) collate utf8_bin NOT NULL,
  `image_preview` varchar(100) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`service_detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=100 ;


DROP TABLE IF EXISTS `service_detail_description`;
CREATE TABLE IF NOT EXISTS `service_detail_description` (
  `service_detail_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL,
  `description` text collate utf8_bin NOT NULL,
  `meta_description` varchar(255) collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`service_detail_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=100 ;


DROP TABLE IF EXISTS `service_detail_to_service`;
CREATE TABLE IF NOT EXISTS `service_detail_to_service` (
  `service_detail_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY  (`service_detail_id`,`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `solution`;
CREATE TABLE IF NOT EXISTS `solution` (
  `solution_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) collate utf8_bin default NULL,
  `price` decimal(15,4) NOT NULL default '0.0000',
  `sort_order` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `image_icon` varchar(100) collate utf8_bin NOT NULL,
  `image_preview` varchar(100) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`solution_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=79 ;


DROP TABLE IF EXISTS `solution_description`;
CREATE TABLE IF NOT EXISTS `solution_description` (
  `solution_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL,
  `description` text collate utf8_bin NOT NULL,
  `meta_description` varchar(255) collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`solution_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=79 ;



DROP TABLE IF EXISTS `solution_detail`;
CREATE TABLE IF NOT EXISTS `solution_detail` (
  `solution_detail_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) collate utf8_bin default NULL,
  `sort_order` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `image_icon` varchar(100) collate utf8_bin NOT NULL,
  `image_preview` varchar(100) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`solution_detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=115 ;

DROP TABLE IF EXISTS `solution_detail_description`;
CREATE TABLE IF NOT EXISTS `solution_detail_description` (
  `solution_detail_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL,
  `description` text collate utf8_bin NOT NULL,
  `meta_description` varchar(255) collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`solution_detail_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=115 ;

DROP TABLE IF EXISTS `solution_detail_to_solution`;
CREATE TABLE IF NOT EXISTS `solution_detail_to_solution` (
  `solution_detail_id` int(11) NOT NULL,
  `solution_id` int(11) NOT NULL,
  PRIMARY KEY  (`solution_detail_id`,`solution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `solution_special`;
CREATE TABLE IF NOT EXISTS `solution_special` (
  `solution_special_id` int(11) NOT NULL auto_increment,
  `solution_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL default '1',
  `special_price` decimal(15,4) NOT NULL default '0.0000',
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`solution_special_id`),
  KEY `solution_id` (`solution_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=431 ;