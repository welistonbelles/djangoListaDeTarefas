-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Jan-2022 às 21:23
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lista_de_tarefas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('c59c67211b55396db3a90b2b94e1a7826e5b7d71', '2022-01-08 18:32:03.648384', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tasks', 7, 'add_tasks'),
(26, 'Can change tasks', 7, 'change_tasks'),
(27, 'Can delete tasks', 7, 'delete_tasks'),
(28, 'Can view tasks', 7, 'view_tasks'),
(29, 'Can add task', 7, 'add_task'),
(30, 'Can change task', 7, 'change_task'),
(31, 'Can delete task', 7, 'delete_task'),
(32, 'Can view task', 7, 'view_task'),
(33, 'Can add Token', 8, 'add_token'),
(34, 'Can change Token', 8, 'change_token'),
(35, 'Can delete Token', 8, 'delete_token'),
(36, 'Can view Token', 8, 'view_token'),
(37, 'Can add token', 9, 'add_tokenproxy'),
(38, 'Can change token', 9, 'change_tokenproxy'),
(39, 'Can delete token', 9, 'delete_tokenproxy'),
(40, 'Can view token', 9, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$0DEo7pdztVQ7jwhglH0hL0$j2NwrELQql370gql6N0SSqX6gV47yTlPf5NJcJvpRrA=', '2022-01-09 17:59:51.881502', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-01-05 17:49:48.193045');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `core_task`
--

CREATE TABLE `core_task` (
  `id` bigint(20) NOT NULL,
  `criado` date NOT NULL,
  `modificado` date NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `complexity` varchar(7) NOT NULL,
  `duration` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `core_task`
--

INSERT INTO `core_task` (`id`, `criado`, `modificado`, `title`, `description`, `completed`, `complexity`, `duration`) VALUES
(9, '2022-01-07', '2022-01-08', 'Tarefa 3', 'Fazer alguma coisa', 1, 'Facil', '2hr~4hr'),
(10, '2022-01-07', '2022-01-07', 'Tarefa 4', 'Fazer algo', 1, 'Medio', '4hr~8hr'),
(11, '2022-01-07', '2022-01-07', 'Tarefa 5', 'Fazer algo', 0, 'Dificil', '+8hrs'),
(12, '2022-01-07', '2022-01-07', 'Tarefa 6', 'Fazer algo', 0, 'Facil', '2hr~4hr'),
(13, '2022-01-07', '2022-01-07', 'Tarefa 7', 'Fazer algo', 1, 'Facil', '2hr~4hr'),
(16, '2022-01-07', '2022-01-07', 'Tarefa 8', 'Um texto qualquer', 1, 'Medio', '4hr~8hr'),
(21, '2022-01-07', '2022-01-07', 'Tarefa 9', 'Testando tarefa', 1, 'Facil', '2hr~4hr'),
(25, '2022-01-07', '2022-01-07', 'Tarefa 13', 'Testando tarefa', 0, 'Facil', '2hr~4hr'),
(26, '2022-01-07', '2022-01-07', 'Tarefa 14', 'Testando tarefa', 0, 'Facil', '2hr~4hr'),
(27, '2022-01-07', '2022-01-07', 'Tarefa 15', 'Testando tarefa', 0, 'Facil', '2hr~4hr'),
(28, '2022-01-07', '2022-01-07', 'Tarefa 16', 'Testando tarefa', 0, 'Facil', '2hr~4hr'),
(30, '2022-01-08', '2022-01-08', 'Tarefa 17', 'Descriacao aleatoria', 1, 'Dificil', '+8hrs'),
(31, '2022-01-08', '2022-01-08', 'Tarefa 18', 'Fazer uma ação', 0, 'Facil', '2hr~4hr'),
(33, '2022-01-08', '2022-01-08', 'Tarefa 1', 'Realizar uma tarefa', 0, 'Medio', '4hr~8hr'),
(34, '2022-01-08', '2022-01-08', 'Tarefa 1', 'Realizar uma tarefa', 0, 'Medio', '4hr~8hr'),
(35, '2022-01-08', '2022-01-08', 'Tarefa 1', 'Realizar uma tarefa', 0, 'Medio', '4hr~8hr'),
(38, '2022-01-09', '2022-01-09', 'Tarefa Teste', 'Testando paginação', 0, 'Facil', '2hr~4hr');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-01-05 17:53:56.326043', '1', 'Task object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-01-05 17:54:15.540943', '2', 'Task object (2)', 1, '[{\"added\": {}}]', 7, 1),
(3, '2022-01-05 17:58:46.811581', '3', 'Task object (3)', 1, '[{\"added\": {}}]', 7, 1),
(4, '2022-01-05 17:59:01.213907', '4', 'Task object (4)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2022-01-05 18:14:43.237008', '5', 'Task object (5)', 1, '[{\"added\": {}}]', 7, 1),
(6, '2022-01-05 18:18:36.122045', '1', 'Task object (1)', 2, '[{\"changed\": {\"fields\": [\"Conclu\\u00edda?\"]}}]', 7, 1),
(7, '2022-01-05 20:27:46.733175', '5', 'Task object (5)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(8, '2022-01-05 20:28:36.212059', '4', 'Task object (4)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(9, '2022-01-05 20:28:49.081506', '5', 'Task object (5)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(10, '2022-01-05 20:28:56.450470', '5', 'Task object (5)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(11, '2022-01-05 20:29:11.224932', '5', 'Task object (5)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(12, '2022-01-05 20:29:15.403228', '4', 'Task object (4)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(13, '2022-01-05 20:48:21.027669', '3', 'Task object (3)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(14, '2022-01-05 20:48:24.837317', '2', 'Task object (2)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(15, '2022-01-05 20:48:27.941555', '1', 'Task object (1)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(16, '2022-01-05 20:48:32.862056', '1', 'Task object (1)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(17, '2022-01-05 20:48:49.864427', '3', 'Task object (3)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(18, '2022-01-05 20:48:54.735138', '4', 'Task object (4)', 2, '[]', 7, 1),
(19, '2022-01-05 20:49:02.979092', '5', 'Task object (5)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(20, '2022-01-05 20:49:06.528924', '5', 'Task object (5)', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1),
(21, '2022-01-07 12:27:30.927643', '1', 'Tarefa 1', 2, '[{\"changed\": {\"fields\": [\"Complexidade\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'authtoken', 'token'),
(9, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(7, 'core', 'task'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-01-05 17:49:31.642857'),
(2, 'auth', '0001_initial', '2022-01-05 17:49:31.990123'),
(3, 'admin', '0001_initial', '2022-01-05 17:49:32.074956'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-01-05 17:49:32.083954'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-01-05 17:49:32.096980'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-01-05 17:49:32.162156'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-01-05 17:49:32.206030'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-01-05 17:49:32.223094'),
(9, 'auth', '0004_alter_user_username_opts', '2022-01-05 17:49:32.231093'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-01-05 17:49:32.265525'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-01-05 17:49:32.269484'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-01-05 17:49:32.277489'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-01-05 17:49:32.292525'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-01-05 17:49:32.307672'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-01-05 17:49:32.322964'),
(16, 'auth', '0011_update_proxy_permissions', '2022-01-05 17:49:32.330801'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-01-05 17:49:32.345729'),
(18, 'core', '0001_initial', '2022-01-05 17:49:32.362588'),
(19, 'core', '0002_remove_tasks_ativo', '2022-01-05 17:49:32.375613'),
(20, 'sessions', '0001_initial', '2022-01-05 17:49:32.400781'),
(21, 'core', '0003_rename_tasks_task', '2022-01-05 17:52:07.974922'),
(22, 'core', '0004_task_complexity', '2022-01-05 20:21:25.466628'),
(23, 'core', '0005_task_duration', '2022-01-05 20:24:12.049446'),
(24, 'core', '0006_alter_task_complexity', '2022-01-05 20:27:25.104064'),
(25, 'core', '0007_alter_task_options_alter_task_complexity', '2022-01-07 12:25:09.167986'),
(26, 'authtoken', '0001_initial', '2022-01-08 18:30:26.326799'),
(27, 'authtoken', '0002_auto_20160226_1747', '2022-01-08 18:30:26.348800'),
(28, 'authtoken', '0003_tokenproxy', '2022-01-08 18:30:26.352687');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7w8rmh2axu8yc4mcay790kw9ofluvh9l', '.eJxVjMsOgyAUBf-FdUOAiwhddu83kPuQYttoIrpq-u-NiYt2e2bmvFXGfat5b-OaJ1FXZdXldyPk5zgfQB443xfNy7ytE-lD0SdtelhkfN1O9--gYqtHHQJ5B1Kg994SGCDoJEjCSMZ6YMDEvQ0pGUQXxRXTkY-FgZlcEfX5AtDiN-8:1n5Xwn:CHYcxUXJGZz5Q8nfBGVsp2gCHNDTVl0tmAjGZFhEPNs', '2022-01-20 18:57:13.150850'),
('feq22pf1vn7qsnx91cah52pj4s4c00w4', '.eJxVjMsOgyAUBf-FdUOAiwhddu83kPuQYttoIrpq-u-NiYt2e2bmvFXGfat5b-OaJ1FXZdXldyPk5zgfQB443xfNy7ytE-lD0SdtelhkfN1O9--gYqtHHQJ5B1Kg994SGCDoJEjCSMZ6YMDEvQ0pGUQXxRXTkY-FgZlcEfX5AtDiN-8:1n6cTv:S2swhSih3yaYjLdtl1VVqYJozfWbmEKHH2eYUksZ2aM', '2022-01-23 17:59:51.886569');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Índices para tabela `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Índices para tabela `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices para tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Índices para tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `core_task`
--
ALTER TABLE `core_task`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Índices para tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Índices para tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_task`
--
ALTER TABLE `core_task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limitadores para a tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
