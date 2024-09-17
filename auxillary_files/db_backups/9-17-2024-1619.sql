-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb:3306
-- Generation Time: Sep 17, 2024 at 08:19 PM
-- Server version: 11.2.2-MariaDB-1:11.2.2+maria~ubu2204
-- PHP Version: 8.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school15`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('4e665f046882');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Alumni'),
(2, 'Attendance Officer'),
(3, 'Board Member'),
(4, 'Coach'),
(5, 'Counselor'),
(6, 'Department Chairperson'),
(7, 'Facilities'),
(8, 'Finance Officer'),
(9, 'Food Service'),
(10, 'Health Staff'),
(11, 'IT Support'),
(12, 'Librarian'),
(13, 'Office Staff'),
(14, 'Parent'),
(15, 'Pastor'),
(16, 'Principal'),
(17, 'Student'),
(18, 'Substitute Teacher'),
(19, 'Teacher'),
(20, 'Vice Principal'),
(21, 'Volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `role_groups`
--

CREATE TABLE `role_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_groups`
--

INSERT INTO `role_groups` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'faculty'),
(4, 'other'),
(3, 'student');

-- --------------------------------------------------------

--
-- Table structure for table `role_group_memberships`
--

CREATE TABLE `role_group_memberships` (
  `role_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_group_memberships`
--

INSERT INTO `role_group_memberships` (`role_id`, `group_id`) VALUES
(2, 1),
(3, 1),
(6, 1),
(8, 1),
(11, 1),
(16, 1),
(20, 1),
(4, 2),
(5, 2),
(12, 2),
(18, 2),
(19, 2),
(17, 3),
(1, 4),
(7, 4),
(9, 4),
(10, 4),
(13, 4),
(14, 4),
(15, 4),
(21, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password_hash` varchar(512) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `first_name`, `last_name`, `role_id`) VALUES
(1, 'taholmes160', 'taholmes160@school.edu', 'scrypt:32768:8:1$dbC5qSAOQhs5jfWE$81078429397bf5b5585a4315571a3c7b4fccccfa8a39271317a4aa129070ac9dcbc1670e7b29c80311f73f88935f951008b985393bf815d84556b328d756e5ee', 'Tim', 'Holmes', 11),
(2, 'stu2024001', 'stu2024001@school.edu', 'scrypt:32768:8:1$IzaEiN4yaS9mkrtN$5582fc1898ce01927c23851a589022d5760dea2268001a86e2db816ba01f17aead90350475d1915f45c80c2b58db6b9c7f86d6b2a5fbc7711f55dfc933c36c2e', 'Jeremy', 'Stitch', NULL),
(3, 'stu2024002', 'stu2024002@school.edu', 'scrypt:32768:8:1$1N3FhDEufG4GFB1S$83518ae47de00fc824cc5631e080848d0fe3889abfcbf26410ab7681552bc97386c3d320999866587476ae883b2cb7f88ee70b62c638cc94696862801a28400d', 'Quinton', 'Kocher', NULL),
(4, 'stu2024003', 'stu2024003@school.edu', 'scrypt:32768:8:1$oVT7iqFAA0N2vPtL$3cc92f4324dcfce0904ec940ab8ce4595fac0329b9abcb8c7840406a7ad5ccc41569395485b8319fa937652549565bc9bd472d5c4d872b659c42e59077b4c46e', 'Lander', 'Busse', NULL),
(5, 'stu2024004', 'stu2024004@school.edu', 'scrypt:32768:8:1$9GNpSQDxXnMHHrbK$0d7a55eeb0a429c946d901d1ab047c1b2f20ddd10eb48b5219b1e014628afb55e28d3b752be3ad3baa3b0398ab61c07a1179f65ccf2fd3eef895621ffdd42f84', 'Badge', 'Busse', NULL),
(6, 'stu2024005', 'stu2024005@school.edu', 'scrypt:32768:8:1$rpuz8K0SeqBGK3oV$09668a183ea5104642f83d168fff85f37ec30431e28b7542fc9c27d77d59022de51601593260b1c5ee745f62d501574973f11561329ebef62e6cfe72d2405ffc', 'Daniel', 'Beresky', NULL),
(7, 'stu2024006', 'stu2024006@school.edu', 'scrypt:32768:8:1$GK5U02kFZ023st2I$770bc63944f03a334d3470b37d4bf3a1b618daf099e5cba827b83f2cb9b01c4348ea941c58c21074a6d549d0557d5311f19d0041365b9fe4f8cf607a7eff318f', 'David', 'Beresky', NULL),
(8, 'stu2024007', 'stu2024007@school.edu', 'scrypt:32768:8:1$pgK29hV8PXNXbCAL$7130863c9ba9b3abc326e6dc890def4bbdca1316a6d9612d1190b01804a3979d3a84bb5aee8d3e1dfc637a42144731635d9f2a2c32ad950c3e6f1ef12555540c', 'Derek', 'Beresky', NULL),
(9, 'stu2024008', 'stu2024008@school.edu', 'scrypt:32768:8:1$5wuOeoXsnHcgRe4t$eb737ade9240d1bb3a5e192960d5929d4fcabdcb4fa8ee6421c8e1956fc594f71f30b30f5d136a49142f9664c3ebcef30be26570097f71ebcf4d3fc54c9fa808', 'Ron', 'Allen', NULL),
(10, 'stu2024009', 'stu2024009@school.edu', 'scrypt:32768:8:1$Czw10EhbEUVeZvOK$96494b01cfd4b22183323f72a1508d4702bce2496dbe1b9ba4898fc262f305ca161ab84091cf2ab22f05f76cb8f4e14622a1024d9284e07d305abaf73d35a508', 'William', 'Arthur', NULL),
(11, 'stu2024010', 'stu2024010@school.edu', 'scrypt:32768:8:1$aJ9xrxcoKR82oZhm$bc351852890eaff8a5302f4bd1d9237ef53700a912cef2aa4ca64b430ac921791e38e946b5086ecea6888e6354beb65eca655aecfa9ee91fdb00426227a81b7d', 'Jeff', 'Bania', NULL),
(12, 'stu2024011', 'stu2024011@school.edu', 'scrypt:32768:8:1$MMMimVcbvwb4Jtqq$6495b9985e1073a8827b816eea6c9e346cf270e699a521fe8fb348a7aa33e20e5abb64e71e3ce8b8f27dc944415fd082ab5975660977bd108435ed2cf22a4632', 'Thomas', 'Brown', NULL),
(13, 'stu2024012', 'stu2024012@school.edu', 'scrypt:32768:8:1$SxBwBAASzXkB08ey$e0d069c06a14d8996dcdecc22095a1edb01305e5b9f593c3b4df388d270a04da06a7e15488fb335869a1cb489d6e9bccf9184b707975d8d0d17e1abe249988ce', 'Jeff', 'Clay', NULL),
(14, 'stu2024013', 'stu2024013@school.edu', 'scrypt:32768:8:1$j0Gc38EAzJxmtE8W$7ce951ad7de55cb9721c73a23d6d83381b859fa28b501bc0983b91e81762ac9826a3a1ee4a1d353903e89716ed6147167022309ef1af4a12d966c86d8e379136', 'Greg', 'Hochstetler', NULL),
(15, 'stu2024014', 'stu2024014@school.edu', 'scrypt:32768:8:1$R4WwOROcJA4NTvzh$90af08f7d4da005ad46c9656e4f96133a507c34fbb9ca2b62662c902e8ecfba2ac627c616a85af478fef31a7f99118256e8215238c801a73170ce066e41f0711', 'Tim', 'Johnson', NULL),
(16, 'stu2024015', 'stu2024015@school.edu', 'scrypt:32768:8:1$TDIuE5YibRR5T2BS$a98c418d8c221eb3830fabbec20e82c44035a499a801e4de3d0d41d9938c3af618c425171e114c29536aeba2908de71f34daa81b124eceaa3d403ec9652da1fb', 'Eric', 'Johnson', NULL),
(17, 'stu2024016', 'stu2024016@school.edu', 'scrypt:32768:8:1$ZjIDcLOOubvWY96n$5b8f63783cf54d89816847795942912398110cc1127da6b6d65122484bf00910d289edb80fd112f931770bce014473a8b74b0d0bad24e5ccfacf0e8c17b78d20', 'Jerry', 'King', NULL),
(18, 'stu2024017', 'stu2024017@school.edu', 'scrypt:32768:8:1$LwZ8eY3hJ2YtLewG$8ecaf56118c58d5d1191025b2824ed7df616d4e3abfbf81da0afcbd8d7c2b17604d562b4ca01f30462cd9204f440d536c77020215741120607738501476541d9', 'James', 'Lambright', NULL),
(19, 'stu2024018', 'stu2024018@school.edu', 'scrypt:32768:8:1$R83lJv1xVWZjXcmt$7c1b5519edabdbc5336793cfa30f3e48249b2543897900d70c955011ad7e2e89c7012ad674606990274c62cfe5ac506a8293d101f7d3a8d610cfbe46ec409317', 'Heath', 'Lambright', NULL),
(20, 'stu2024019', 'stu2024019@school.edu', 'scrypt:32768:8:1$xeWlAZ8VhfLsxmIt$19668cdd10e36dbff80d70d127d9444f5bacbe92a336507e2467ed7c37295f3c1dd389fc96466924b4d59106f5404031a24902146861377ec9d90ed243c9da41', 'Rod', 'Linville', NULL),
(21, 'stu2024020', 'stu2024020@school.edu', 'scrypt:32768:8:1$IPiadDjBc7eayPMU$0d60cc4ae6f39587662bda6b98c913243650c47edacc5b6295d91ed616232e6aabfafd499c09e7e5bf6b6bdfddb365f123351ef95758c8744492b2282d2eb909', 'Brent', 'Lowe', NULL),
(22, 'stu2024021', 'stu2024021@school.edu', 'scrypt:32768:8:1$PmeaRKJMYxIGk45j$f57e6bdf220323986f121721664c3c8ee346055c55916c72afc7db874da6e714fbea09a18de01e1c0ca5def97e418c1cd427bf4fcab0e535a2fdc7d24568b903', 'Rex', 'Lowe', NULL),
(23, 'stu2024022', 'stu2024022@school.edu', 'scrypt:32768:8:1$2imGj0ZayZq1sIqY$a15c8d9a72a8c0591bc98ec6221a0c141064689a1c05011968b12f5a54796c88b3b208dcc51cac03f673c00ee8da362857b3a1edb81c778d5b110b30c525c854', 'Brian', 'Miller', NULL),
(24, 'stu2024023', 'stu2024023@school.edu', 'scrypt:32768:8:1$UBHledXwh41X3UmL$c998d0e14018a05c1aea5213ca35228f1192541e1242b014c662dfde2fb92db653aad435b1b435d8125c16eb7e65e865a4459d4b636a9612081b743552e4a78d', 'Frank', 'Oren', NULL),
(25, 'stu2024024', 'stu2024024@school.edu', 'scrypt:32768:8:1$YxIMViIFCEZDNCYY$49bf696d0cc11cecf8a2ee87f74ec677c5fdbcf5771fcb56947326c7b3dcd5695f8a44a2770bfa7fec2ec03e1fe8e570dc3b5e3f9baa2e3827cd6fd1710bc800', 'Matthew', 'Patsch', NULL),
(26, 'stu2024025', 'stu2024025@school.edu', 'scrypt:32768:8:1$CfRYMtMriQ1Cbs3z$dc77d1814a52af0a3e2d196b84f1a6faa54bef5030f1f5aa0be0fcd438f3c838eae1639fb43f46c74a88240a8ab5528e5fd20d81b230a6d9daed71801bc162b9', 'Chris', 'Ricker', NULL),
(27, 'stu2024026', 'stu2024026@school.edu', 'scrypt:32768:8:1$vWhXnOQOYPaujt1V$0156440449c4966f82f4c74e517abd4a293bb9011ff890f352ec905ea7262ae4aeb85fe01e1e322fa9c77b4b67ee7dfbb63b8a61b8aba1ad3cf855ae90773d34', 'Alan', 'Ripper', NULL),
(28, 'stu2024027', 'stu2024027@school.edu', 'scrypt:32768:8:1$Gy17cUVPWff5yATG$d5bc4589a99ae8318baed4c58a4d43b8d308a8a1fe11f431b8c32448073e2918f01ed4f2abcef885a611852814745a2c2019413af9551d192b77a88290b3fc15', 'Adam', 'Ripper', NULL),
(29, 'stu2024028', 'stu2024028@school.edu', 'scrypt:32768:8:1$LfE9wrYmmzbN3TG7$bae34a79f02d8c90eef68aea2b937777b00984fcd899bd1f780c2452454862f73c703ef81460168c2a31e6b5afb422f725ff80782d1cb3624b4f95b0f8519fa3', 'Tim', 'Scheutzow', NULL),
(30, 'stu2024029', 'stu2024029@school.edu', 'scrypt:32768:8:1$ApbpyEE5KxuTXvNs$6c1fcc92a688b7dd011f78e8e57c66959bd6765a84db89e9d3d48452b098df1b2653cf046fb7fce4e123f69a5fe893e7e7f487bd1099a5e9eeef2f211992b431', 'Jim', 'Surratt', NULL),
(31, 'stu2024030', 'stu2024030@school.edu', 'scrypt:32768:8:1$WAJRNixqlzNxOzTO$2d02c571cba2cd72eba70e7460c82a2d5adf15f006e3165816a22aea1311de5b50bd51191f262b58a4c2807393126320623dc14833b6fb81ca129f14354c2c2c', 'George', 'Vermilyea', NULL),
(32, 'stu2024031', 'stu2024031@school.edu', 'scrypt:32768:8:1$h5KkdV85wjIrrhMV$49fadea4ec4079deaefacc6eabcadbdc52776ceaf3b8e9b234a44d7042acaaef17dd67eda18be8fe8017308caad92123bfe801913dc8ba4a2fc3e9dc6a71df32', 'Michael', 'Winter', NULL),
(33, 'stu2024032', 'stu2024032@school.edu', 'scrypt:32768:8:1$TMuqbuAJ6NFf1xyp$fc9af7f7a9e12846fc382540da7b42376bf4744bf8baa3330d99832a28d62deeb81aba03f4bb64cb162dba3b230d22b554edc27d16e0b336d615f413eef259f6', 'David', 'Winter', NULL),
(34, 'stu2024033', 'stu2024033@school.edu', 'scrypt:32768:8:1$JOd8LDDvmUsdtp2H$ad04bffa917a381854bb9cde9b85d5357fec2ff6341145cef9bf76d2e5ab208379001875c91e84665a87c73367b1d74527e0dda25f1fbfed5d5fba5fba5f41c4', 'Bill', 'Bixby', NULL),
(35, 'stu2024034', 'stu2024034@school.edu', 'scrypt:32768:8:1$8iHL1eDwNtFlNmzV$5a48ce5d4d96c18699407f33ae1076e5604737bd53fb42c3c284d9b5b4cec28b5448040ac54011db4991ec2f6f4ce3e4e0964fa00427cb3823469ce8d5e1b581', 'Justin', 'Brenenstuhl', NULL),
(36, 'stu2024035', 'stu2024035@school.edu', 'scrypt:32768:8:1$EQ1ybKBVyqbzBnzW$c20dd8af9f4d1f39bcf5a4bbf9e3f7da2f82bcecc155e518c6f37562bf2bf4af5bf3bc48ca913d137d2d1a98f40701244a5d6f9dca5318dbc05905c0ab0cfd86', 'Bruce', 'Collier', NULL),
(37, 'stu2024036', 'stu2024036@school.edu', 'scrypt:32768:8:1$PuqwF6AXx1gZ5z5Y$c7ed8b9b4cc2e9658f543475a3975205c8d2a53beb81d6e8a06ff857b2aba0bc3f7ded7064f54dd2fe79b947ed2162eb63bfe264444cfc3dd41b9b0dd9bc6a0d', 'Matthew', 'Hoert', NULL),
(38, 'stu2024037', 'stu2024037@school.edu', 'scrypt:32768:8:1$AtNebi7Cn4j7Pzdc$fba0ab2a0f8c62c4876e59f4e235165abf06f77917848988975fa6e9138c587c80fdc940475b9e17e790dba7529ea2b9970df5a4ce67516cfae5383e5a1d849b', 'Chad', 'Hoert', NULL),
(39, 'stu2024038', 'stu2024038@school.edu', 'scrypt:32768:8:1$q8XfvQxOZfHdGQw9$14305bb028c39a2950618348dc232ea15971d1ce4e03c946d2750d2c920481a6f911abd07390903acafacbc69705905779d69e4c00f889948192b9dc5ed859ea', 'Joshua', 'Hoert', NULL),
(40, 'stu2024039', 'stu2024039@school.edu', 'scrypt:32768:8:1$ofbngMwY4zmryFse$8dfdec03b04bd80dcd70593e395482d5fa9ecf45e54de4bd25ab7d69245da680ebb35af67fa1b9487ebed26f5f5214b2a543ca70d8ccef097432bd04561e83ed', 'Zach', 'Misenko', NULL),
(41, 'stu2024040', 'stu2024040@school.edu', 'scrypt:32768:8:1$TYqDnUeykMmjxlsq$15a78aa41f34cbcbac21d5c16914cf733a49f7f7d424b04e8092141cc6a22b84ca73c086a7c7dec001fa819392c16c6af73b1d2ed17b7e5af33e47d5101dbf5e', 'Adam', 'Misenko', NULL),
(42, 'stu2024041', 'stu2024041@school.edu', 'scrypt:32768:8:1$5buVXhZkfyabJUlG$9d75fa1daa419b1f8b24245fc39457e7a73de3eba666080c80ad7b48611ecd429fe5048ac0bf6298870ad38c20232812f50f15c1ca4725479cfcb3e4c6fcd4d5', 'Seth', 'Misenko', NULL),
(43, 'stu2024042', 'stu2024042@school.edu', 'scrypt:32768:8:1$HllPR1kMq3XoZ9be$b1f4685de3028f2520411fceebd6493550953faa4dee8db34949132e74898bb84f3110bcac29292ff8aba110ceecc9140b6a83853abf4ea905a78c969b2524d0', 'Rob', 'Cook', NULL),
(44, 'stu2024043', 'stu2024043@school.edu', 'scrypt:32768:8:1$EsxiOCJJoZVmkyom$e8277e2050c19998e70651f820350aad64055fad060f0b1884c151659a542c5110188767cb9e28367d198e2be1148ef26415644a909f2449018873f371e0743f', 'Shawn', 'Gebbie', NULL),
(45, 'stu2024044', 'stu2024044@school.edu', 'scrypt:32768:8:1$UfZ69OXOLXBRAtvz$1acb6f479de935b44c33e868d4437fa9f59f3ce2355a94aaa9b6e1b264c344832fd111518d7ba40ce5abc3ab78e2b13f2e3e0621b4dd84c9b2b9523ba130778e', 'Christopher', 'Conwill', NULL),
(46, 'stu2024045', 'stu2024045@school.edu', 'scrypt:32768:8:1$og2qlxAXzFplP6v1$8d115c73fb64841b5b7d8744bcff705ffc4caff4e6c75f2ec90688c3475f4fbb42659066b9a38f2d65591ac6424bf416429a8a223de96e07964c2fc31e2568ce', 'David', 'Conwill', NULL),
(47, 'stu2024046', 'stu2024046@school.edu', 'scrypt:32768:8:1$OWXUxHM8uP1oJbfT$1607bc228efc8cd7872f89d89cfaa2417a6fcefe1958257cb4cd01f340bff4877eaf9f08422895077311be292968b75019422ee3cf51722418801eb4927f9bf8', 'David', 'Gillespie', NULL),
(48, 'stu2024047', 'stu2024047@school.edu', 'scrypt:32768:8:1$Sk0BGJrCCKEjeBqz$c5a16918a173e1407302a688198885c9f7820804b3e739fb157b4b28ee3886770339b614cecd164632d41ac21e4c45351265eca132abb7847ac5aeac1f12047c', 'John Mark', 'Hershberger', NULL),
(49, 'stu2024048', 'stu2024048@school.edu', 'scrypt:32768:8:1$3hlLk8MfJUujcqh3$7e21b4fb49659d5b7132eef88192dfd2d8ce78259cd1afccd460b375889b7d2eacc5ade2c44d8f653a3083cd38f5d979d8756e48c8c95b4369fc1b15265de8e0', 'Kurt', 'Kramer', NULL),
(50, 'stu2024049', 'stu2024049@school.edu', 'scrypt:32768:8:1$evTbYIP2BjrWauE8$ec969c8c5efa4cf9b8eb4c456eeb16298b366a0c5d6d106c14cdfbbe4279e82e823d595c86b152bdb09021d1a6811b8f4da1fa13e5fa21365ad70347def2d7cf', 'Kenton', 'Kramer', NULL),
(51, 'stu2024050', 'stu2024050@school.edu', 'scrypt:32768:8:1$d5zpcITCWm4mK25a$aa1f9a9a1a035d3684728d0b6c193966a6f2dbd1f4dbc90aad0166237d762add8d3e4fefe98f6739b9d8b89a1931269af13e7618ebd2e223aecb585f56f1fac4', 'Tommy', 'Lamborn', NULL),
(52, 'stu2024051', 'stu2024051@school.edu', 'scrypt:32768:8:1$8pmJBwydzVUpxGZV$64b7c0c60e618e3062c8bf600fcc388693218468ca648b7e37bac51854a81e1419e21442ca281224123a83a2f6dd8c04b57386ea7803494b1de8241c135e6e5e', 'David', 'Lamborn', NULL),
(53, 'stu2024052', 'stu2024052@school.edu', 'scrypt:32768:8:1$42TR3MFEQiHYD2LR$31ce5cbe2afbccbd1c9139f614594c93cd12ae5f9d8f84238cfb3d9dc4baaa3078c11e2b81fef197ac6b7c865daff8053cc843727c4cd04f4ff1258054627f57', 'Michael', 'Leach', NULL),
(54, 'stu2024053', 'stu2024053@school.edu', 'scrypt:32768:8:1$vvMvnydvsiE3wqzy$8194eca7f1ea5a19c425f1f36571f4ed02163003d6796e82aff8b907f01c89396850e9cba6324ac56ddfa76a82e09b7c4aada5bd12bf1311ebf9ea4c87f4dc05', 'Jonathan', 'Sommer', NULL),
(55, 'stu2024054', 'stu2024054@school.edu', 'scrypt:32768:8:1$5lSfJP35uy1Dz4O4$fd666be55515b132e74ebdcd6e887ace27d5ba8464625f910f869e1dd16510a6af7e9cfd9093265702a1f8aede19d465bdb2602377eea98ba4059a698c1f2af6', 'Timothy', 'McQuerry', NULL),
(56, 'stu2024055', 'stu2024055@school.edu', 'scrypt:32768:8:1$9YANSHGUMwj8igg1$91565c42db823a727c76ff356263bbff06764950dc1fc5321b3d1bc478f57b6ce293eddd0be32a3427dedaaa6416f915de60d4b8e68a292a0908594e3c5261ad', 'Todd', 'Meridith', NULL),
(57, 'stu2024056', 'stu2024056@school.edu', 'scrypt:32768:8:1$QfmkxQCJuThQaCsT$bf2fcf5267f004a98cc3cfa34b1eb126140eea4b463051e3ddb4a1f49347c5e30a588c6304e5b767f5cb5907e8ffb43ba34f5c6496b4080cf4306a9fa9c0b8cd', 'Sean', 'Miller', NULL),
(58, 'stu2024057', 'stu2024057@school.edu', 'scrypt:32768:8:1$IECJD35rMjiOVyOr$412621ddc6134d1e9c3fd053aaa23d9e9a8d73b6da80a24e98ab8dece9ab538bed54d9f0c964b9103c9571270beb7b156b74aab9754fd5c91dfbfa9bbb29c8f6', 'Reed', 'Monegan', NULL),
(59, 'stu2024058', 'stu2024058@school.edu', 'scrypt:32768:8:1$U8qELjnKA1yqU2Vo$1ad3cdcb124d0d256d544080805073c8613c0e9bf97e62df131cd3c79c69b2c974393306ce5947b57f35afe291d2617edf91f429573bbbab872fdad574731cd3', 'Steve', 'Nowack', NULL),
(60, 'stu2024059', 'stu2024059@school.edu', 'scrypt:32768:8:1$h430x3Cizd4jTFc8$1cbb33281b17c0a6ce2e1d5678612059207c046379499dc7586bf0fe1061d589413a6494085b0c3e1c79f46dd290a02d2f469f41c5a8956b35ac6229b51b3c0d', 'Matthew', 'Oates', NULL),
(61, 'stu2024060', 'stu2024060@school.edu', 'scrypt:32768:8:1$z9XzywFQPYNGEhaM$4d37a2e41d18c2a051b1f82cedfe08c133273c58caa1650b48ecf05469d72cd7909c0cffa2cd405378298a0f6111619ab8347a74c7a1ccb69d13631b1f8393d3', 'Kevin', 'Payne', NULL),
(62, 'stu2024061', 'stu2024061@school.edu', 'scrypt:32768:8:1$4NLdTcd1GIz9OBKW$fa1c8e19c24f75bb5af5a71eb6c1e5ce41fcfb76477c90ac709fd6aee063a15d5d2fa09d979021b79f173a0a1febc2cffd1c231bb2efa7956508c57f4db51a4d', 'Rick', 'Powers', NULL),
(63, 'stu2024062', 'stu2024062@school.edu', 'scrypt:32768:8:1$1RAmogoTSTL3Aux2$6944774da91a3421781031060c36bd746612ed144c63a27d7bc5234716b1210f664fbd23a523d63ba693a2a303d1d26dffbfb6fbb208c92b303e24a0323127c8', 'Joshua', 'Powers', NULL),
(64, 'stu2024063', 'stu2024063@school.edu', 'scrypt:32768:8:1$i76d6NR0x3x0Psgb$81584e366606836d59f98d39852b89a33ae5598c561ee123e6871ca9850182a339c8702854e4bc6a3bb39153b01b87435da709ac296d1e78a77b948093dc3e9d', 'Ryan', 'Roberts', NULL),
(65, 'stu2024064', 'stu2024064@school.edu', 'scrypt:32768:8:1$ntL15tHJpzI8YnFl$b0fca4596a466ba513eeefeeafce5e323ce9d667aa5e0771cdc10e6fd71d0fb6163ad041fb9bf6f32fa0ad86fd673742c81c7840d34dd1300366bb7b0c339eed', 'Darin', 'Rosenvold', NULL),
(66, 'stu2024065', 'stu2024065@school.edu', 'scrypt:32768:8:1$m8ZhB01eZkhAA4HE$16e2d54c17df81242516c2354748b6c19f058451e94ad3431fe63ef5ed122218e9afe6d0e402f2322c316d322bb640ac55615c21c0d1f17656d9adb3431f8a37', 'Jeff', 'Roth', NULL),
(67, 'stu2024066', 'stu2024066@school.edu', 'scrypt:32768:8:1$gHgoVKv0L4jLdJ65$5b7248cc0d91066d8d201218d5e865a9e9fd51910e938c32fce43124ba5a116f2a4eff1aa29a5c002b5951567aa94b9f16843838bcb25bde560435f3be91d701', 'Jonathan', 'Roth', NULL),
(68, 'stu2024067', 'stu2024067@school.edu', 'scrypt:32768:8:1$O5dRH2XHrqQAg48F$5ed9cc612544c5f12bceee42afb39c200188e1c50c44175533fdae5a43d8405f19c82f43ffc5bf6c29397e4748438802aec4b0460a09a0c18984b0c95725968b', 'John', 'Sebestyen', NULL),
(69, 'stu2024068', 'stu2024068@school.edu', 'scrypt:32768:8:1$EbABpGImWzke817L$b5fdff15549fd246d0476a1166a0155bbad3b930b84c39a338d18e8960dc4fc2ffaf12453ff21393bbbd8ac9da481db3060b9452a36b48d67949322d4cd23fb9', 'David', 'Snyder', NULL),
(70, 'stu2024069', 'stu2024069@school.edu', 'scrypt:32768:8:1$Fx70LnFQwCpvu6uH$1f29c9348ba978fead5f94cf06e9a45dcd63f04710186833cc5d6f94607d3ed92578c384221805ca43338fbfaac9257b0b6ccc90905fd83b6a31cfea367763ca', 'Timothy', 'Work', NULL),
(71, 'stu2024070', 'stu2024070@school.edu', 'scrypt:32768:8:1$HhfQAxBZMdrOovG1$d7bf7d2426824609dc9bdbee7f76535f4aef26d0ac174c5a47935086f31cc3290e4c3cb6441e142275606e4b2474bc4e1fe07de3160e37aa343459a63c40fe97', 'Andrew', 'Male', NULL),
(72, 'stu2024071', 'stu2024071@school.edu', 'scrypt:32768:8:1$v6pZZS1FaKtwsXzg$25b7002770ad9447c649bafed5957c2345cd95567f46c61914cbec21ce02cb6816748e79a1b8b550ebcc3c5867d46def007551f0aa594af2948085f8ca4c53b7', 'William', 'Surgeon', NULL),
(73, 'stu2024072', 'stu2024072@school.edu', 'scrypt:32768:8:1$meBDAHLdMIzkyxhr$780aa52b5b49eee7516aaa1e40869547ce0c62929d085e69dd7226e149296faf107d07dbd4c4ad1ae12c7d18ff6e0c3afdb9aea0c2384c2e39ea2b5a1f6565e2', 'Ben', 'toot', NULL),
(74, 'stu2024073', 'stu2024073@school.edu', 'scrypt:32768:8:1$4mBcknU4E1NcTZVM$1f7891f26a6050f121450a91826835653eff3110f0b3a2ca8322126aa338bdb9bc0a64f87aa6d1ad56f24f8546ea803cacc3a7a776b03e9e43be414bb7544e03', 'Michael', 'Smith', NULL),
(75, 'stu2024074', 'stu2024074@school.edu', 'scrypt:32768:8:1$8KY2wDohbo8RexHZ$b350c32f3533bbeb1b585b2e7b55ec0e02d272a1bdab4a68f38d08e98ec5d12b347f3a7b1d75a2c9d04c809879263acc55ce5b65e0738bfed49dc490114d924e', 'Robert', 'Ward', NULL),
(76, 'stu2024075', 'stu2024075@school.edu', 'scrypt:32768:8:1$kg489wLxWQnhbMpT$084ff2cb60a84f2fecfdcb2f0be125469b803b0c603af9afb5eae8e6497b17554f93bf418ddd46e00792659fec330929f28f3f7702ac8a4dd65375b4d37ba7d6', 'Bob', 'Weinerheimer', NULL),
(77, 'stu2024076', 'stu2024076@school.edu', 'scrypt:32768:8:1$KqLFurZKfCUJBVHQ$0e2286551711d6c5f82cb75d98dce8c1faeb22efffdcb2cdc6cd88785f7f6baa15a09b824223132021fd3edfaa762be125581b9438dae5d0b343d180373782df', 'Jeff', 'Williams', NULL),
(78, 'stu2024077', 'stu2024077@school.edu', 'scrypt:32768:8:1$j1R0hG52SafLcnW2$b5c1cff170b6b8d87be8046f4ef3fcf32a4c4f0549df00377a22c11ad0a1c2e88928795b5bfa78f246328ba3f36781165b609f0cd31a63c158368394f8812732', 'Bo', 'Wilson', NULL),
(79, 'stu2024078', 'stu2024078@school.edu', 'scrypt:32768:8:1$d7k2wyxxPJhyoFYe$db8bbed6fd372d7edc047d77c523a3d3433c56b243111ddff6885cdcfdc8c6abff1bafdbf33dec6874819a4c1414a9025e4306152d8475ac5fb38282890280e5', 'Bill', 'Wilson', NULL),
(80, 'stu2024079', 'stu2024079@school.edu', 'scrypt:32768:8:1$avaDSUmtLnqxUGx2$95226c388c57f0fd0dd4d41d8223020c9af61a2470c0abe750648a9d856d6b5d0d95bf83a40ee413f59ce732bd247c4ee4ed55141109854331fdabd41a0bd0a0', 'Brian', 'Wolf', NULL),
(81, 'stu2024080', 'stu2024080@school.edu', 'scrypt:32768:8:1$A1BbngCIYwQwzI6u$64b34cc06691e8c59a96dcf2502f0180777d3646dbde20278f18964cc48d8a41ecebcaef2984e818c92e9579fbf836c47e76d9371c9788f795de03021bc0f67e', 'Jay', 'Hardback', NULL),
(82, 'stu2024081', 'stu2024081@school.edu', 'scrypt:32768:8:1$vwBgEghXnwpNhriI$07bb2704a09ddfde88a386cc24d5ddcb1fbc896829d9f3b41bb5813d76f034f61a3549de8057ca233a69c8e2c6d6b7f7eb0639c1ddbf4f1cc4fccb2652125225', 'Joe', 'Phillips', NULL),
(83, 'stu2024082', 'stu2024082@school.edu', 'scrypt:32768:8:1$tIVo7pAoUweJFtF0$841098a8622cd79e47b160b7be0854c38ff893b5155b09a7b72aabb854384392f84376f75416ac5305ef6bc8fc6b13f61771c16406859aa1adb61efae4b6b846', 'Linden', 'Phillips', NULL),
(84, 'stu2024083', 'stu2024083@school.edu', 'scrypt:32768:8:1$JFKyBCcc4ZfjnBwm$a00b7705160540f9050ee6d8b7c74e7371f1c316e46e857baa15d7d6405ce266a36f710a2075bc125014339699ed651ffd25a586e9f91ef0e34a6c3ed52ae5b3', 'Tom', 'Smith', NULL),
(85, 'stu2024084', 'stu2024084@school.edu', 'scrypt:32768:8:1$yZUI7E9ALAvHNyNL$48b15bf60cbe310d0788f231ef703b2165fbdca2db1495a16f9ade3dd544982e817979887033c47babc29aa5d653e27fac1a0c7d14ef9f5e2393d5fb06b31263', 'Thomas', 'Ellison', NULL),
(86, 'stu2024085', 'stu2024085@school.edu', 'scrypt:32768:8:1$ruV9pxrJTpuCBt12$6cac82d3b35c6700439e3a6ad74f388bd167c9ae98228245eb15261982fd83e00ad0f124ad2601ba7c343f92ce12ee2ddff9f3dd5ae7768ec043cfc9ad8f9405', 'Ben', 'Legg', NULL),
(87, 'stu2024086', 'stu2024086@school.edu', 'scrypt:32768:8:1$fpbnju0AescVmee6$39889f3ae5bfe67c859919e44cc38fc9b76ec4acff154d21c99c969f9822cb66d4f13127825916b15fba37079070eb52a0e91507e5f42977c70758aa7a94485d', 'Marty', 'Walker', NULL),
(88, 'stu2024087', 'stu2024087@school.edu', 'scrypt:32768:8:1$0Yo5wrp0bNlFICmE$f3b233eed2294f52dae9513b003f87462f9e6c5eca7af7c9b9b26b781fa0397e719d7efd4d6774fbacf7fea9a3d40c3dbb7395e2d71ca4a1329fb2e998e2ef09', 'Bobby', 'Scandlon', NULL),
(89, 'stu2024088', 'stu2024088@school.edu', 'scrypt:32768:8:1$lYobPxuwOWrWLv1E$2ac272d0109ba91fd4e977db49845afc3ac65128f3103192487f36fe816c6ee6159c2703bc9f4fea4eb0875f0eb8394afbf9b90dc280fdf6fa989b9b7c9c8cfa', 'Patrick', 'Scandlon', NULL),
(90, 'stu2024089', 'stu2024089@school.edu', 'scrypt:32768:8:1$wMwPsR8rfRkw98m8$b51c249e5db7a0b45459d034c7d22c2a672049982e42ce9ebcb63f0388155c2e906012281ab5d7ddeb7742d11cb6009f6203c0e77be7d46950dbf8a392604391', 'Willard', 'Scandlon', NULL),
(91, 'stu2024090', 'stu2024090@school.edu', 'scrypt:32768:8:1$g0vq4YHAZTYTNBh4$7842779e0a53d4d3cf1ca08348ccbebc6e7eb8200fd8f4f27698848fc3df79b17e5368ed1aeda081ad015e65177d6a35b421e091bb765884887bd0fe6a30f489', 'Austin', 'Scandlon', NULL),
(92, 'stu2024091', 'stu2024091@school.edu', 'scrypt:32768:8:1$wW5N61EFIgMAj4Rb$ed765311d27de074276c2cb3555f5b30ea833983cf4da0a74cd8baef1e83b46f93f5d450038954b656b19c9ccb3a283a90ce8dc08766834032ad660bbdd99f4e', 'Jimmy', 'Myers', NULL),
(93, 'stu2024092', 'stu2024092@school.edu', 'scrypt:32768:8:1$xpv5K8da6wWdpaDa$ae27084165a9fc50b4d73b0968bac771afe36250a790e9aa02418bca88f76aabd3df4a24ab1b6cc69f9a789e6d111ff4ad77a4d17dfc250f6a80ee61fada3ece', 'Tony', 'Dulgar', NULL),
(94, 'stu2024093', 'stu2024093@school.edu', 'scrypt:32768:8:1$nldM1a29vODwcK2C$4f0b350aae32b402780a07bf2721671b320c57caacea49241c6725aaff0fdbacbd465240a517adbf2fcd8b442ba90cc91b2e3b1affd5f502c4415f6cc6a4709e', 'Clifford', 'Phillips', NULL),
(95, 'stu2024094', 'stu2024094@school.edu', 'scrypt:32768:8:1$CLUp3n27gUyaKm9S$5a34b19783802301cc2a594342a4adc8307aaec6660167c73fc5430ceeaaa05a690e9d2a3d6bbb19ffa519d13a72de01b3e0e589ad4d8d684dc3f464c7e98bf2', 'Scott', 'Phillips', NULL),
(96, 'stu2024095', 'stu2024095@school.edu', 'scrypt:32768:8:1$LKGzMKodSYvesPlx$53e95cc5d1cc8c22811e22ced115a022f6442d27612b9c25f6587bd81aa7ecaa36553423816eaec850d5f39897db59e409e43888f24ccea2e92c44727f1a793c', 'Rodge', 'Campbel', NULL),
(97, 'stu2024096', 'stu2024096@school.edu', 'scrypt:32768:8:1$kJBwuM5SclOIQD2g$eb982c04cb507f9d1779e5a51062a6acc288f77de0a489876ca89719d3f37cf871312689ff77f238e87751fcfd3dbb8bc7e574efc2f64ea9c8285ccc609884b6', 'Matthew', 'Perkins', NULL),
(98, 'stu2024097', 'stu2024097@school.edu', 'scrypt:32768:8:1$huAQL4oaOWtx2Ssq$e97096bb0525938d6395593e28f840fc2a6d5ce23f517b80fe4027c2793996e150cf890d7ce11b443357d76013516484038ce80906b59ac0e1df13d4979627e1', 'Leroy', 'Meadows', NULL),
(99, 'stu2024098', 'stu2024098@school.edu', 'scrypt:32768:8:1$QvkY14E6pIutrH0w$4ea8beb80b8d1379e2e34bf35b072b7bc30889e89152547f4ca839d58b3c80145e27757a4d2e11327836c9721aaab6603959bccbbaa473ab540b32d84d9c7256', 'John', 'Mullins', NULL),
(100, 'stu2024099', 'stu2024099@school.edu', 'scrypt:32768:8:1$TR0RM0cvWSVr3Yxp$5db80937d6a9f293d9d56bf1d97edb3cd9f4877783d1359ebbb645f58a535d1438f1dabc9cf65977f8bcff2eb35fdb61937a76d2b5b5c4f431392cabb3a9e7a4', 'Clifford', 'Roop', NULL),
(101, 'stu2024100', 'stu2024100@school.edu', 'scrypt:32768:8:1$cKZRsj3zs52XlThP$9429d83f91d18725ea628f689773b75a09a0920970d9bc491bcea54affd00e9837e510b9aa53a14ac8a7ad253dc5a2ba1e6f8ee2a7939fbcc1a82d1d74428e12', 'Timothy', 'Roop', NULL),
(102, 'stu2024101', 'stu2024101@school.edu', 'scrypt:32768:8:1$laWyCKr4gcDLQLGU$ba277c3e74036de4214f29678f9b2f0605080afab27c110f156677780720987f5249981fffb1039d51b9744ef041566e2b916e6e5b0a607abfb1a13ae1fd9474', 'Kim', 'Roose', NULL),
(103, 'stu2024102', 'stu2024102@school.edu', 'scrypt:32768:8:1$KBrrV5H0gWNqCJre$55b16d0664158c86d525070b9050c534e381c5b040a40cf51de0f6be7dcf3fbf859e98ed87ae94f147d4d3a7c748abe45ffbd694060a579234e263bd3cfedb52', 'Michael', 'Tanner', NULL),
(104, 'stu2024103', 'stu2024103@school.edu', 'scrypt:32768:8:1$NR5Cj6JVmYnKQobu$38c8883aa88ae7d4103782e3e4fc3a5400b5ffb199ce784614e76f115edc7c21bcdde5ffc52544c808c7908116839f5d68924f9f4588825464f10aae15fefe65', 'Michael', 'Vanek', NULL),
(105, 'stu2024104', 'stu2024104@school.edu', 'scrypt:32768:8:1$62dFHdMNiR7Crcc9$fb6cd53f4f4bae38667f1658a2c38e6f930aa4bf5894975b00f10d34080e8bcfe1ef3dc3f5b0c2c53a74702eb0db60d84c46fff8eb3cd3c106e4ffaed494342d', 'Paul', 'Brentlinger', NULL),
(106, 'stu2024105', 'stu2024105@school.edu', 'scrypt:32768:8:1$BjtvXWqQysKzTepV$4df31b41bf551e16a3b9b70be8d492e09755da7d0d6aa113761351fb32fa314e16b140f2670dcbdbd3d22f3e3e92b32b82fe4b9279522c72e6543282b9011fa9', 'Paul', 'DeHart', NULL),
(107, 'stu2024106', 'stu2024106@school.edu', 'scrypt:32768:8:1$khnZr0PxaD60N5FG$639cd16c0db8adcb84581513d8d5bda536397c452219811794b3f2c2cdca97fad050faecfa8063f1596ec7d536c2f0b974c207dbea8eb3cc51db361cb63d7d36', 'Nate', 'DeHart', NULL),
(108, 'stu2024107', 'stu2024107@school.edu', 'scrypt:32768:8:1$9YdSLE6KcaGIAQow$9d117899bfc95162b84aa36aa51cb633f6a754e466da3ffe27770e833a5ce2f90db430f40f5e6e7abcde7ff1f4074056caef39057cfa69ef5673732e5b2860f6', 'Nate', 'Wolf', NULL),
(109, 'stu2024108', 'stu2024108@school.edu', 'scrypt:32768:8:1$BBNHpyD8ENI6dCdE$0d201bb8c9a54e130fc9af8d8d6e723cb0f4df17b589908e3c5b55242cfaa63b08ea38cdbb5d52f546127874168aeb85e187c3f806a29dcb4ebfb0f4d713c67f', 'Grant', 'Steyer', NULL),
(110, 'stu2024109', 'stu2024109@school.edu', 'scrypt:32768:8:1$HDoTqh5ZqLUpdNpo$f75e359e9c8f327596777296788af5466030ad1a681343e922257e5213fe9633bf4b146a5b57b06984cf9f546e3cbacd73b028eab2de82756dd170f33a0d1fc4', 'Todd', 'Steyer', NULL),
(111, 'stu2024110', 'stu2024110@school.edu', 'scrypt:32768:8:1$HvpLmoGgMNrFDUTj$3c800ffaf7d000a1ffd1baf3a368c00a0d5f434a97962c26729d5812905d2ff303ef5b7a03ee6a682ebf5d2a7275a9d65bd8879bc7c8467c28b4a3ea204f25b9', 'Teddy', 'Guyulas', NULL),
(112, 'stu2024111', 'stu2024111@school.edu', 'scrypt:32768:8:1$9XjZIOYOJomqau6B$6cc3631e3216ef27ccb2104126e304f1fd74ece00600fe4c59499bf2e68abe878f38d83f547201102c91ab55b867378731682ce76817fb1305cc10c1d1d2ec06', 'Tommy', 'Guyulas', NULL),
(113, 'stu2024112', 'stu2024112@school.edu', 'scrypt:32768:8:1$HpdcXdcArFNUIhbF$c17f0ac183d9f1574c447bd0a1212cd5381d1f022a389d349d3b2367ab3a1dc7109de18362becf82263ab3040eaba3ab64aa8175e8884fd7ccab2027959bc2e7', 'Wyatt', 'Cravatas', NULL),
(114, 'stu2024113', 'stu2024113@school.edu', 'scrypt:32768:8:1$KNRC15yIun5RbSZn$6009888f198529be44c6a3c8fcc72f8d6f9188dfdae19ec88c6fb523a9b44d6c70eeaf5a4262ce62723e18e9b9fb3027afe3b34e78d667696a2b0b379e9ee386', 'Michael', 'Deuring', NULL),
(115, 'stu2024114', 'stu2024114@school.edu', 'scrypt:32768:8:1$NsCgxlQz6Zcf629b$270ddfc5567e4077cd8468e1ab59a4666d74abcddf98c3f8bab27b200a020a9cfd99fe3e3f29a0b86870e86f27787f1dcc91010385ef607da6bc4237b76499d0', 'Aaron', 'Hicks', NULL),
(116, 'stu2024115', 'stu2024115@school.edu', 'scrypt:32768:8:1$6KdEZ9DMcuiyfh9L$2824daebc59f7e77abec81b0780ea53dac81e4c44b392190ca6728a0d089c3e262cc693356433be95ce8af9a5c1772706f8dedc633b54b60841abc8c5a26a662', 'Doug', 'Dougherty', NULL),
(117, 'stu2024116', 'stu2024116@school.edu', 'scrypt:32768:8:1$nBBEAgCeQdRTAZeR$cee4bd380eda67c44aa00cdf1bc7993ce526b153b7cbdf6d71281bf698b8c5b5ef281a9c67d7d57a117019cb4bc343880ca13b896becf5b6a2524a2e9a5f16b8', 'Matthew', 'Honaker', NULL),
(118, 'stu2024117', 'stu2024117@school.edu', 'scrypt:32768:8:1$M9YatIQjAvtdsuP0$c76a28316e17e453d3ffab5045c06fb2464d6aa2732959199cf8fa9029214cb1854164685bd56619108944a99f7240fbcf5f49f7d2f6b30e618f4a672c3977b8', 'Andrew', 'Konya', NULL),
(119, 'stu2024118', 'stu2024118@school.edu', 'scrypt:32768:8:1$Ll79nKrga7sqqbbh$d9231654bcf6b1ac589bf86836cb13deb51113d400691e87f081134d9a04f583784822340c9b4697d5f525cf9ce9f3fb3a33b41208d13e691d73f1a64382015c', 'Fred', 'Leach', NULL),
(120, 'stu2024119', 'stu2024119@school.edu', 'scrypt:32768:8:1$77TylITsPLxHAqV5$a13a57c3e4706a1644542172871494d061c9536d24ca178ef330622ca9f1a25451cefa4b832d09d562b840fac226dd607fcde6ec606fd6b272ad4090bf702d58', 'Cole', 'Morgan', NULL),
(121, 'stu2024120', 'stu2024120@school.edu', 'scrypt:32768:8:1$TV9U4J98l9hsHKfI$1594eb6b8a49b8e55defb146affdb0482c72b804e65c60fc87ffe34be9131c9a1f3f828d93b8c6fc27b7ca9339b87baf73f5860d888e7dbd9f8b288d4f01f416', 'Keeler', 'North', NULL),
(122, 'stu2024121', 'stu2024121@school.edu', 'scrypt:32768:8:1$KQb2LsbXFCtxCjVT$58972ff34a9447487abadecdb82ebd2b0e9de4abfa4b89a10503dc20b2782d836784cda3e68dabe576fbf77656e34356c9c007183f500834a2465cbc88564051', 'Jason', 'Routzon', NULL),
(123, 'stu2024122', 'stu2024122@school.edu', 'scrypt:32768:8:1$vkw0YuVBKZDvLGg3$0e00d253c49a2648eaa5134c196a99c294e0345bc400093df84f01ad41df6b4563eb3241ff45cc4d4ce8515e5a8332b7f09def276ba15fc6a72a40574c63a0e3', 'Jim', 'Shimer', NULL),
(124, 'stu2024123', 'stu2024123@school.edu', 'scrypt:32768:8:1$xIzZcv2x0A7E56bs$ebbf00a2ab39fe1d2078814622ec2a052bf33cf793a7dfd589eb9acde35777d156f5607e4a6c51d2691f9c624fa5090e6a6ea9890c9c3d2c0848d3c6ac58e89f', 'Kevin', 'Tinter', NULL),
(125, 'stu2024124', 'stu2024124@school.edu', 'scrypt:32768:8:1$4zpv7xrF2ZxtEJra$6ef96ffac62e8343eb122e40ea4de8dcf6a762679dd43e6f371ff8de4ff862c48da2b0ce4562ebc6f3c308ac8b78cd10288f56d5fac77b6407f0a7eadcc3c415', 'Daniel', 'Tousley', NULL),
(126, 'stu2024125', 'stu2024125@school.edu', 'scrypt:32768:8:1$eemPCAD16ZHG2HGU$454f8f2479885530e0a3480a4738f1648f7adec3938baa807b2c9974d476b19dea68b73b6a754ac193f1b0db4adc60b6b7f70583ebc15244de81643e70af9785', 'Paul', 'Tousley', NULL),
(127, 'stu2024126', 'stu2024126@school.edu', 'scrypt:32768:8:1$Kq6RjcjZwgVIICAO$3c553fd76f48d3f6e75ebf38ac44ebf5e6ba3ca307b014fd50c7ba7cd581249a73034a9bcd2b891dead538d853fe8d468aff6e08cc67c8681ae5186eac998eca', 'Adam', 'Whitney', NULL),
(128, 'stu2024127', 'stu2024127@school.edu', 'scrypt:32768:8:1$bPTn6LPc1bJaJeXk$1093223ffe105308e0323c6f21ba0f161995695223aaa6efca5e2b86b93b0bfa7721d6fce273934332008ced15a85ca84d350cf873751adb3d2bbec92bb8ec31', 'Seth', 'Whitney', NULL),
(129, 'stu2024128', 'stu2024128@school.edu', 'scrypt:32768:8:1$gL4F5iK4SlHkdtKO$8f1376237b19aba6069cc93bda6dccc7869e5dbfc56915635d37984c85d7a37783011310d56a926a1d31df08caef77e4934ed7ed929996136aa485f43e2cfbaa', 'Wesley', 'Loudermilk', NULL),
(130, 'stu2024129', 'stu2024129@school.edu', 'scrypt:32768:8:1$V1lumzF1XSjbRQQf$262721dd6b561dc41fc71ba6f9272b3bb663e64e8825c02bd00af3c882c1a2b88c0550ce014796fc1ccad22abd59b854b5081bd32874e1ba35f9cff78d727a01', 'Wesley', 'Ziegler', NULL),
(131, 'stu2024130', 'stu2024130@school.edu', 'scrypt:32768:8:1$PwbxfzizRn5rrZzj$2772df79df28bc548813d849fef98b92cd2ad6a08167a34b5d71b49f7a15c7a9f8c8ac80e5ca4cd3f632f08541331d49192ad2f9fe3571aae2c8c419cfd868e4', 'Charles', 'Ziegler', NULL),
(132, 'stu2024131', 'stu2024131@school.edu', 'scrypt:32768:8:1$hsWEQrUZ3Zs58a72$6ba2928b6c9afbfb0255c5a4ef7edb16affd426c750969f7db2c8021570de79f5ea7c2a391cf83c3bddcd47b5a86dbe909e5e7c1ea73d4a94571fd558ea2f75c', 'David', 'Mullins', NULL),
(133, 'stu2024132', 'stu2024132@school.edu', 'scrypt:32768:8:1$0Gj0nowHN8hgYP7k$9a3d870d5e2911cf6b4091a2c3f537eca916d5aa9bf31d1bef4f5a3feafbbccb8fb365e8738f0e51414dc310898ecc9608abce536fe1203d5a3589f397d7536c', 'Scott', 'Severence', NULL),
(134, 'stu2024133', 'stu2024133@school.edu', 'scrypt:32768:8:1$wCdTDHWLbRnYosXI$a4fde87950f874ec956b471e8a2d785f566eb9604327f0aff53a801952a5483e6099f93855b0c006a9e44bcce1103619d59824c6b2e828d6d441fb39aacc1fcd', 'Jason', 'Stephens', NULL),
(135, 'stu2024134', 'stu2024134@school.edu', 'scrypt:32768:8:1$ZGYlkY7QBQ9Xendi$971d58274d1bda8c5fdfad53e2ec65e7c422cf12f635c7daf71e234fc4714ff08c7fb20aac8126afad6b2d3db9170be02d9385a002a9fa8de5ad924c126b4cc1', 'Brad', 'Seivers', NULL),
(136, 'stu2024135', 'stu2024135@school.edu', 'scrypt:32768:8:1$im7uw65S9g3wrVZ5$6df9507ffd5725c2f7b31a10a23b07246f4e192a6827a2d8863f3fab2981951e6caecb9a5345a34fd909d205544e758bcaa202cdf807dd8b3ff400407317cd22', 'Zach', 'Oswold', NULL),
(137, 'stu2024136', 'stu2024136@school.edu', 'scrypt:32768:8:1$Wma0lyvMDgtQzzq7$d6ec84ae075e0ee9568bab9fa83a570029446b1cdc8f96d75a0adc8e633c05be25e49a092119afc5c97f2ce44d1f28e7abd3a6868162ddf77784e821a195f9bc', 'Wes', 'Boggs', NULL),
(138, 'stu2024137', 'stu2024137@school.edu', 'scrypt:32768:8:1$tsJBoiBaZHUXDyn1$a77ea21af018a6923a9dc0f1fcc861d7dbdeb4698bd494da08d869d0eaa7aabe1d1a584ba4d83e4286d2015a1dffb4928ab6c4196d6e26d4f701ea29721b1828', 'Matthew', 'Strang', NULL),
(139, 'stu2024138', 'stu2024138@school.edu', 'scrypt:32768:8:1$v7eUleDPKuD8r7bw$91d050eb31fcbae3d47af86cfb9c994e040302c59d8d2b433b866b20ed4cd191f92b0fc1e976c4cbc1c23a7c282f3e7315fcc841015b196994674d8a03ea7bb5', 'David', 'Meisner', NULL),
(140, 'stu2024139', 'stu2024139@school.edu', 'scrypt:32768:8:1$56cBSa8c6vg8T88o$f0b5b4d9d3d0726f9b21efb49e1eb8237b46385d58adb0ac7fdb8d021b501af17a7373a2654f6f83622eedb473eeeb418937509089c968c21e0efd0e311953f6', 'Wyatt', 'Henderson', NULL),
(141, 'stu2024140', 'stu2024140@school.edu', 'scrypt:32768:8:1$oNe7xnmcXY6ht6aT$50377dd8a7e863b6875647ed81854bf1da9b026961ab978111ba1bfd53f202faf2d6576d58d96703fc10fbf20766570c7b915dce15384e9720a0dcfb803942c5', 'Adam', 'Wonus', NULL),
(142, 'stu2024141', 'stu2024141@school.edu', 'scrypt:32768:8:1$RJLLYQqu5n7qQKFf$8bc408f71d648f3151bc0e88633b94b13f1a5e3bda1da73005b4af4c686b88294680456135d4e15210a290ab78e752941d216a3bbc6bf0159cfb19257924a3d1', 'Matthew', 'McCleese', NULL),
(143, 'stu2024142', 'stu2024142@school.edu', 'scrypt:32768:8:1$FqhMp87Ut8GjajIj$881ff97cf09bd3cbdee6a8b69d73229b5492b3942a95ad745060c44bcfaa5635712e12bf6b0ef47632877df8f541823fada258534279243bfae004659210b90a', 'Cameron', 'Vogle', NULL),
(144, 'stu2024143', 'stu2024143@school.edu', 'scrypt:32768:8:1$Vs1Aw54pxiwqywjT$49af5a92fe73c0841265ca9a351b876d1d303dffa4421187e690b638295dbb99a2015961039f7e510d3c3de41ea6da8c9033acb3b7b2ec0cbdbffae39b00feb4', 'Bodie', 'Hillwig', NULL),
(145, 'stu2024144', 'stu2024144@school.edu', 'scrypt:32768:8:1$wm0v6x0qW1pr3d4X$447fdc2c30ccb4ed5226aa7374474ad31d5e206393890d46ae584971bc85f3fe7b6c9254ec2bbb9e8b47ad7677313e38bced10afc02e9eda5137ee069ea4f614', 'Kevin', 'Pesheck', NULL),
(146, 'stu2024145', 'stu2024145@school.edu', 'scrypt:32768:8:1$3W22absNc0BqSzqH$b89e2be35ef37330890322f351c6d2094dd3b08a848b0c9843fc3a15b7933102679539075583dbdc4d71d0d44c15be07833640d7ab7b3548e6cbe0ce0122ebbe', 'Ian', 'Pesheck', NULL),
(147, 'stu2024146', 'stu2024146@school.edu', 'scrypt:32768:8:1$tgM995tSBzvxZQA3$c05bfd8e0b1b087f777945d2c0174eaf8e045a48683023b039a30a5d24f8e877e59f7a2edac82dcd09fb993fb7123f21d62615416d5aec383fec0aaba60ce4fd', 'Christian', 'Pesheck', NULL),
(148, 'stu2024147', 'stu2024147@school.edu', 'scrypt:32768:8:1$2GwYvZKFA7dDJmWR$192d1fb214f1e88bc31fe82e1daf950ebe05cfbb62cf480aa072884b714f18a25e42c474e4625717c6403651f30af1f5cc29729e6e8e0227595a458a53b002b0', 'Andy', 'Zywick', NULL),
(149, 'stu2024148', 'stu2024148@school.edu', 'scrypt:32768:8:1$UM0yOg5KujnswAig$028f17c94220146adb480e794b304811a475d7b0e92809e82a3a336315b2919398e3e52fe68137622a91bfcb5e77fe231e6aa580eb4902fdee023693dec88e73', 'John', 'Zywick', NULL),
(150, 'stu2024149', 'stu2024149@school.edu', 'scrypt:32768:8:1$2TflMJABr2apE1Ld$153df2be24c05908a879edabe2562fd7157780e58fcecda75c010c90ac5d7e66ff9c5c8b9196f2a5df08549d1e202194f3c542f7e82a8b1bbfa38d277787ccc1', 'David', 'Brown', NULL),
(151, 'stu2024150', 'stu2024150@school.edu', 'scrypt:32768:8:1$gc6h8HggweoJBDH8$441f3d8ab421b8ce68f0442af357ccf3105e0adebbb2e02fe6ba3193dd704e1700f9ab01af569cab4942c35eba398c5d04f1e914d403dc818fa6e4dc627b9a5f', 'Andrew', 'Stefan', NULL),
(152, 'stu2024151', 'stu2024151@school.edu', 'scrypt:32768:8:1$tSHMtg7chcys2mp0$a4cab892b39c4d8a86c6b4f6e3ddcd840db4300e3c72d70760a1f26ef980c18c99c2362c99de6f1800187d045605f53cee45d224040ed10dfc9d6e9df6b8391e', 'Matthew', 'Stefan', NULL),
(153, 'stu2024152', 'stu2024152@school.edu', 'scrypt:32768:8:1$krDv6UhgzbFIc2As$ad26f910a5d6633e19bae004c5f5ca8c3e0683686a75d5dc34196c0650ddb1190821b5aead377fd6f28672f9b7f48154fc4ae98c9883d98f1cd6cf5b26367920', 'Christopher', 'Brown', NULL),
(154, 'stu2024153', 'stu2024153@school.edu', 'scrypt:32768:8:1$o81GXNW9oyNMtuBh$741a5a2cf752b9d29e180b02c5614170817f71c2cab9416dae2402b766fa3b4a3d33edc1b5c6a290e75f64e9596b4bfffd5c1ff8e0a3d34e94650a7e8c1b453c', 'Ben', 'Olsen', NULL),
(155, 'stu2024154', 'stu2024154@school.edu', 'scrypt:32768:8:1$mgQU5dpIEoRJ83xP$1eec7e92214f6666a0c2869b871c6cb854771bf13e3da0b1eeff0169183dce67f2f0c2b94d8e0b272f8259f01eab4924e1e3929183f20ce8d3f2065112603d33', 'Bryce', 'Sedio', NULL),
(156, 'stu2024155', 'stu2024155@school.edu', 'scrypt:32768:8:1$9OHAtP5SVNiXeTim$bca62c82e02acd1eee7b8abf76ef86a90605d86cb8d0f7d952ef02fdebd5f68ec238363eed997b64282e883e2a62a8f26c3f45b8b606e1a8d16763ce9bf7b50e', 'Jared', 'Wills', NULL),
(157, 'stu2024156', 'stu2024156@school.edu', 'scrypt:32768:8:1$BshyxhwWreiRF8Ce$b9ec5beb975599806686c412cfcdedddf27843fb57ac6caa388d3c37706d1fdee6027f2cb945dce0ce3beee6c8e9946356be117e72cfc9ac20e2599cb6825bd1', 'Nick', 'WIlls', NULL),
(158, 'stu2024157', 'stu2024157@school.edu', 'scrypt:32768:8:1$Vcvni87Wsm7TEJIF$c2e84bcfcdf2164d7d34c398a3bf730116d94c708da42d61be742efbd193d739bb24bf965256a1944aa09516abdf51bade0a17c6ad40114cd33ca015ac269e40', 'Casey', 'O\'Brian', NULL),
(159, 'stu2024158', 'stu2024158@school.edu', 'scrypt:32768:8:1$ZmLtjXGOzFZhdyh2$3bff2fd41a1f0fb3e5ac0f962f5080d0a7c4ccc9aba867f1dee255ffd2a4880d16aebb5525f8870db0f2924c4934f05457ce1f1e681382156f487c7c12de15fa', 'Shawn', 'O\'Brian', NULL),
(160, 'stu2024159', 'stu2024159@school.edu', 'scrypt:32768:8:1$2KLPYNp5boiUy9MM$2db927892ad28381b5a05afd56864ec92b9cdfa401ec3dbf1935f3f7c0eaa5a60f106754141871dd786cd04ac9fda7bdc4ecc1c90be2da06f8ae1fafd66ef6b7', 'Jason', 'Linden', NULL),
(161, 'stu2024160', 'stu2024160@school.edu', 'scrypt:32768:8:1$fpULmFdk6b8M2y52$308103aa30825dce440e0dcf3bc75ccd28955b55190866acf5b72f15419319a8a14deec2bfd140a702ecafa6ad24187f7252694b6238792681b7f3568863a46c', 'Perry', 'Cohen', NULL),
(162, 'stu2024161', 'stu2024161@school.edu', 'scrypt:32768:8:1$irKbICWKXHeTSjRy$3feeea39d9d94ab9e7d4de521d2d7965623222e6f31a7f805c137dc530a2a8a56a77e9895cfde60903ebc8e3d4298794089eb74cfc37ba382e94b8d7858fc4c8', 'Austin', 'Stephanos', NULL),
(163, 'stu2024162', 'stu2024162@school.edu', 'scrypt:32768:8:1$OWgUJxOSjXogQ32Z$bf5ece253c369a8cfa42e9c46e0b0520ec06e1ea26cccfb42e04687d9f84ce7135b8dbacdd82324f4ac687a60380edfcedb6acb7089ec2a39106dcce65dd80a5', 'Steven', 'Roque', NULL),
(164, 'stu2024163', 'stu2024163@school.edu', 'scrypt:32768:8:1$rA95bAwl8H9A0UfS$01b22b71c6c0bb4aed2d4e41473c49f3da5ff432882e41d7d971a3c8c3a6814af3bf23a979138e65bcf8741e61c34e990265aed4c760edb949740152c13f0211', 'Nathan', 'Roque', NULL),
(165, 'stu2024164', 'stu2024164@school.edu', 'scrypt:32768:8:1$Vgwt4f8mBCCNVf2N$a3d8fbd00b888766548e0b4d4441182a6ea11c19e9cbfa79d79ff274a12ab565b98173697a94b26e347b56dea3a784679e3c3e8d30b83e84c7386bba5d517316', 'Geoffry', 'Martel', NULL),
(166, 'stu2024165', 'stu2024165@school.edu', 'scrypt:32768:8:1$JP9tzZcj0skka5Xw$9a2d6d2eb1867c32699bd2180082aab6bed3cfb4941e9a2c8740b19c4d8b4c050cfb8070fb655ead5a274d6ea7fe5b26ed4de870fbd00744bd9f50c8c53834ce', 'Gregory', 'Martel', NULL),
(167, 'stu2024166', 'stu2024166@school.edu', 'scrypt:32768:8:1$iaMXpjZ4m1ZPsqtl$c6c794ce677b1450cb1e18524811e629844240e7d95318b28e04fc64bcd55904d3a06aef016d421c4a31a3c643e5e2939b8410fcde1334401076695acfae2f95', 'Grant', 'Martel', NULL),
(168, 'stu2024167', 'stu2024167@school.edu', 'scrypt:32768:8:1$DBXWH98lIz34yqh9$3c2139ed7a4af78337b4e023099ec01098d5a002a6153df6fdb23a8a65051069be1329c4cb0a84332a3b3ac737b270cb3a1871ab4c8c7b35d5a8a5b3ee284932', 'Eric', 'Clinton', NULL),
(169, 'stu2024168', 'stu2024168@school.edu', 'scrypt:32768:8:1$ovJZ9fEBkqgFmxv2$d24c46e18a5fe034da6174d436fe7811f10ba7f351fa9650031984a01a523f4ce33882c8341665d9bda9ee2d0e56faa539a9e83c3e16f428feeb06d11c471d0f', 'J\'mark', 'Boliver', NULL),
(170, 'stu2024169', 'stu2024169@school.edu', 'scrypt:32768:8:1$SgLU8SeUxtJgUSEt$68a8a3b5f8c16fa6d0df1679777a49d3192afcd4e04d0b63496833342dec9a20ed0a946d049fb7de433b4d9218d746c87e5ce992fee40063597a0399e60d364f', 'J\'Herne', 'Boliver', NULL),
(171, 'stu2024170', 'stu2024170@school.edu', 'scrypt:32768:8:1$XbVYWuRqpmXaHyuX$cb9e3a6995c64f68beb30633359579e40dbabcd8c204713eccccd65d24672521dafffe712dfadbe8772c3d4257d1904118558a98e927db05347501494767152b', 'Mark', 'Zurowski', NULL),
(172, 'stu2024171', 'stu2024171@school.edu', 'scrypt:32768:8:1$SwTsscIF5ncjzQu4$5acdf3c3900c653b918aecb27bd5703609cb04b0dcac3ca702eb59be53037b4c3c3cbfc9c1ef48ac6e1e3f90e3005e973caa25e7c2d71ca4b1d73a44061761e1', 'Matthew', 'Zurowski', NULL),
(173, 'stu2024172', 'stu2024172@school.edu', 'scrypt:32768:8:1$Oi50PBQ0lbP5noaR$3eeea1f3e94262b677394842770114954b314f32672efed793c339df233ac9224b58bf2e7c86b5a11bb7b74c0b8c280eee6097a7c3b9e9b1f986a8bf32ef3f15', 'Michael', 'Zurowski', NULL),
(174, 'stu2024173', 'stu2024173@school.edu', 'scrypt:32768:8:1$BrUVn1DQQmyx3WGq$de4f116e4b700069682ed75a00c758d9504401edbd23c760bde7a5fbf6f3beb33a6093fc4f79a1f266b04ca535d1105f72cc9b06eb5a48820897edfde3e2e8f8', 'Duncan', 'McCord', NULL),
(175, 'stu2024174', 'stu2024174@school.edu', 'scrypt:32768:8:1$IGtnW2OLrB3nAJf9$6d0f52feca9237f21bbab38024940b1067887514a87943cda24203c99f18b83771905f211f34a8cbc6f474f25579c7cf03f8a35cc4610aa86f819637bd40eb92', 'Malcom', 'McCord', NULL),
(176, 'stu2024175', 'stu2024175@school.edu', 'scrypt:32768:8:1$OcnOBAXQvTzKj68Y$554c78e731a8c7a81993861d05aa5791e4e807ec5ca2e02302268cc17722962e9fcb9b9f0ae163875a2dd3d7258cbe47393e2bbe82c8bf8f6143ab35ded7a926', 'Angus', 'McCord', NULL),
(177, 'stu2024176', 'stu2024176@school.edu', 'scrypt:32768:8:1$knrE8Sx4FSQabK3m$a1bdfc3ae7cb9ea51d50ac0f48ad4fc25f852693231dafc4b127098f9f0f3a8bfc126092d21b945aee72e6f3ddc161019a3b855bd2e4eb7566ed0bc5f83dd6a5', 'Clay', 'Parris', NULL),
(178, 'stu2024177', 'stu2024177@school.edu', 'scrypt:32768:8:1$fNTMBglfCtoiVlmx$f6d1c299a47827b7b64c2b55bd57d3f8c0b6b1c0003bbb11aa306116727a6133b93dc204de0e643dc09a252b2289d83defcf7afd4e5f55375f8dc81436a0b6e3', 'Kendall', 'Virginia', NULL),
(179, 'stu2024178', 'stu2024178@school.edu', 'scrypt:32768:8:1$0BsWGOcsbpVkOapL$51db72e976f54a85004793fbacb519d3298341e41bf37edae671c6702125c1d2c90c25ecb921330ab67ac58bd4fc12163728d7e17d7dc7d30b3f4eea84f92303', 'Mathias', 'Uribe', NULL),
(180, 'stu2024179', 'stu2024179@school.edu', 'scrypt:32768:8:1$KybVF7Zv5EH0IjSF$74f5cc6b021fe91567f605ef44cbe8a58bfbd023dcb9fd2f6eea92d95a7f39f9082638a9e13332dd4d63be7494b264658738dc0bdfe0d63394a3b1a52e5d0c3c', 'Nicholas', 'Uribe', NULL),
(181, 'stu2024180', 'stu2024180@school.edu', 'scrypt:32768:8:1$l161h2DROhiDhq3X$9e231647ed96fc8233de4794d718821c37a261c6a20cbefe410cb9ba2f7b82401eea220ad1c178e6b9bbf211fc2e00a065c11c5f74de3a12355af378b5247365', 'Michael', 'Stolzenberg', NULL),
(182, 'stu2024181', 'stu2024181@school.edu', 'scrypt:32768:8:1$bZN3xLp0EpU3OBOw$3ae755fd952f996ea4b034ce5263ed040b4769dc3a5c97b5383eae2722aef1dfc77ce60d54e4edca3fb0ffcabcf9e8014010d20887715565b198dbfd55a3ac5a', 'Harris', 'Stolzenberg', NULL),
(183, 'stu2024182', 'stu2024182@school.edu', 'scrypt:32768:8:1$8wyoUyzMMHHqhldF$e5c1f187cac0a83c0d6ba6e6891dfe2cf291e4f160dca89baead23c6125c5a32057b1aab23582dc63f6a9f832e0e462520b3ed7cbadce3b9145326a2e7c544cf', 'Philip', 'Mashki', NULL),
(184, 'stu2024183', 'stu2024183@school.edu', 'scrypt:32768:8:1$RAx4F9Y7RjdyHcY8$a6b4d7d1905b1353deec1b03640e0b3a4e1ed7f8be1516cd5ffc1cecc7edac379590d2749197348b23c3c1628bd4c0b527cc092c7fa5d9e29ee7cce5f3a442cc', 'Philip', 'Mahi', NULL),
(185, 'stu2024184', 'stu2024184@school.edu', 'scrypt:32768:8:1$Mq71AimEajTSsYt2$329b2589231646110b656e34ec877b25c6ff7467b444c9e79427e22e8dc4175e54f520f332b30f0f5f7357c56cbf735e48ea0b12bbaceff0fb6f752b32df02b8', 'Florian', 'France', NULL),
(186, 'stu2024185', 'stu2024185@school.edu', 'scrypt:32768:8:1$Wuyo42rxb9hk6A2F$08eae597cceeba361484556aab821d36ec334524212de1c235113480d5bccaa1fa851633db0fb3cbada38a17a89736b8d795541e7e3652bd8d3d00d70da04f61', 'Julian', 'France', NULL),
(187, 'stu2024186', 'stu2024186@school.edu', 'scrypt:32768:8:1$bY2YhKpkBHkKoSLc$beee5a8ef7bb33f6c033c8b89f36f18d827fe27fc12f28863a1be3e7c9ebedd773d5c1f26de6b54f6a345db6faa9fe82576ab3a11f8d73445192affd027e14c1', 'Donny', 'harmison', NULL),
(188, 'stu2024187', 'stu2024187@school.edu', 'scrypt:32768:8:1$8zL9vHS8aFeD1uJq$79fa15abc53cdf5b324e9b69652b9a8b0da7272073af9c2db81c2f61c4d6dfa3dfd9f102de5b1ef02a30083e88983f7ab2813cafb38b07c6c877aec5ace8fd7e', 'Donny', 'MPMS', NULL),
(189, 'stu2024188', 'stu2024188@school.edu', 'scrypt:32768:8:1$M2VLustiSa9rRNuT$e9a691dfd91e5e7a4ca6da58361f3de27bbc346ac932e8b75ac293f6995bd23f0b0dcbb14ea0057a6137083c342f1f5b1f3b8275d60e93192b14e8153aff6765', 'Chris', 'Keope', NULL),
(190, 'stu2024189', 'stu2024189@school.edu', 'scrypt:32768:8:1$Yudm3fp7NHeWDdkS$5894e4a4f9418f8c577dd714b8fb81b0c53764652045f51e616714341d54d2707830b8db6f1a2981eb635f15fe9692d125b27520bb8441af0f37bdc87acefa30', 'Jake', 'Carner', NULL),
(191, 'stu2024190', 'stu2024190@school.edu', 'scrypt:32768:8:1$rC97Jrdr0I0Da3z5$a0dc377a6112ce9cb1d61204088d1510975ad0993519e91671219e8dc7bcd30b5dcb2a628fc206d071b2e5e1c873eb2cfaeecbe96413bc997359af4ad9112f83', 'Jake', 'Jurowski', NULL),
(192, 'stu2024191', 'stu2024191@school.edu', 'scrypt:32768:8:1$InVTi6sC13PFaQWp$1c09fe9984f64308716ea540a6c4fd10902346058e4f93bb49c9445f036811845b5b5dbc2dd15fdad17f561e8324d5f8ccc2cc182193df74cdd63a961518cad0', 'Robbie', 'MPMS', NULL),
(193, 'stu2024192', 'stu2024192@school.edu', 'scrypt:32768:8:1$PcJNSmZg8DAWyr6j$ca2f394915c8c7bec899f4323da1aa62cef651863830b13329b9c95fbbce13c05898f92fd610bc4cdb2f3bb401186af29071ae919661ac069c5217792ca36ae1', 'Phillip', 'Green', NULL),
(194, 'stu2024193', 'stu2024193@school.edu', 'scrypt:32768:8:1$1K0HhVCBIUsTSQOr$6b0f9cd2ca2e3309b45940d8503ce8a81e4b8f7ba7e90d4f57cc70b1eb9f091b0068964ecf5cb9b2dca6d21842cad5a3c491612b48f58718b142b38b907f828e', 'Shawn', 'Green', NULL),
(195, 'stu2024194', 'stu2024194@school.edu', 'scrypt:32768:8:1$pqgwshgmS9Y26bhl$3c16fbf04ba00ee82e2a850106cfd149443b1262551fe3e445d18eaacb7450b6c8b03840a835aedba07a14cfad14742ddc9d6f48c929660510f91ff0074f503a', 'shawn', 'gray', NULL),
(196, 'stu2024195', 'stu2024195@school.edu', 'scrypt:32768:8:1$3Rm1bCLiCK9WCvkB$e7199fb128b6a290a0579713c1da7b1803c1c6f539f71ac28990c2cea43812f761c2babf1df032d376d735b97dd3eacca32fb44a6ab1674b2130d59b0be795d4', 'Brandon', 'Knight', NULL),
(197, 'stu2024196', 'stu2024196@school.edu', 'scrypt:32768:8:1$5gBDV9u71YmUDh4Z$b5125ae344c619960158a1461153fc242da9cead29cdbde47907585a6a3aeae56b93c9c38861321cc0371ac85648e08bfc52d6e55dae38438d52182cf455e4a4', 'Phillip', 'Wilsie', NULL),
(198, 'stu2024197', 'stu2024197@school.edu', 'scrypt:32768:8:1$I0UcXuq5uJhOBL1v$8e4cd484bd6b56f94859de440ea0bd32738fbbc1849b9d6ed796e613a287e9d7801d282fa9dd2f6324fc4da0e6510d84335406fbc0404eeb89dd11ec1bf57a0e', 'Caleb', 'Hollo', NULL),
(199, 'stu2024198', 'stu2024198@school.edu', 'scrypt:32768:8:1$sjhHkzxjzlZF1PQf$e670a680b90e534d1c72b63af37398ce476400d6331f6a6fe38c964ea1db8d25f434edcb95b9278fe67a95ff6151204d2c22a615718e672d5505a155cd718e06', 'Jared', 'Grey', NULL),
(200, 'stu2024199', 'stu2024199@school.edu', 'scrypt:32768:8:1$cTxaukczwSb7sMEV$1ebf6f976355b8a9d3c47da0381e0f83f44e251cb073ddfef2915ca145d7649aea168efdab23e70bbe65924abf7c103591137c1a254536b02b9336dd9bef1aa2', 'Redmond', 'Gerard', NULL),
(201, 'stu2024200', 'stu2024200@school.edu', 'scrypt:32768:8:1$Zd6vBTKy8krJMfdS$607453160c42e0842653afffb2ec7763e7ec3363e816e463f96b547cfe751e63f4f3681903e1c10efb1bbe1a3e4b28a37ff9780c51fbb514d82f83a9741f1273', 'Tom', 'Holland', NULL),
(202, 'stu2024201', 'stu2024201@school.edu', 'scrypt:32768:8:1$XQIlX1xcdNv6lX7l$b4096e8bed38fd3402198a9449474779bb28033601a081c0a448bd28e059550bc9eeeaa80e0d3112abffd989164a3fa8432d3a69cdd67b9e834a489107376d99', 'Lucas', 'Judy', NULL),
(203, 'stu2024202', 'stu2024202@school.edu', 'scrypt:32768:8:1$erSsqiCAsGfRz7rJ$e19a10eca0a153ec4f8ae29cd6a3c5d36e419d9c28aaeced95805b59e02bcadfde88f62bba3d5cdf35aa636a220bbe6338be33472fe2341ef50791047458fe4b', 'Lucas', 'Benentt', NULL),
(204, 'stu2024203', 'stu2024203@school.edu', 'scrypt:32768:8:1$Q2uYZtLngF4VICxt$7dbaf79f6b2d91ecfd2c1500664ea3abcf3484d36f2553a98a667a67539a79fbbc18bb9c4a29e23776c79cb7c64b2b3390adfac8247c18c8544d620007c62cea', 'Jared', 'Enting', NULL),
(205, 'stu2024204', 'stu2024204@school.edu', 'scrypt:32768:8:1$CqVW07nTVJbR61CS$a8ac1308bce8506dea68088412a2f4ff4bdfecb8f625ba25322c27a4a3bf0b58b393361af1f6aac10c88340af3c140f160b4ebffbf06040ee3c67dba6613e14c', 'Jared', 'MPMS', NULL),
(206, 'stu2024205', 'stu2024205@school.edu', 'scrypt:32768:8:1$fcRi8basgDqIMeVo$87a91a06a9521ff95645265a5cf7e0b8ce0b9e1c6a59603f028bb007a41cd2704b19fe2970ae80ff65a4961fe91d935fc8bfcd862fa6ca0b3cf38bcd2bd5d0d9', 'Frank', 'Panstingal', NULL),
(207, 'stu2024206', 'stu2024206@school.edu', 'scrypt:32768:8:1$NnNn9LZvdEm3u7to$5bcc705142f1989e44e74f545060bc5e9f57b8247c1de9b3c05da3f099dd35b1d8bb048cf4909a23883f1d45be590f8e9c83f991aaec254861a4c471e63d6ffe', 'Adrian', 'Wilson', NULL),
(208, 'stu2024207', 'stu2024207@school.edu', 'scrypt:32768:8:1$rf82yhMkHLZwjHPs$9b8a1d1fc64567c8855c69b489f72304239467e62dbdc2202f70848889ed0c40281cae041e571d5c5fbeb434a1cfd96524cbcc327b6aafff0ddf9be417f79207', 'Cory', 'Saddler', NULL),
(209, 'stu2024208', 'stu2024208@school.edu', 'scrypt:32768:8:1$qf4hUzfOuxzPwRbf$393152549665240152c3450837530b0ec940b1b4df4bc7eba6df38d70fd33e4d2f72316d254b940a53fb069ddcc17b586f505f92946e3e8f68b1870d4f5a8bb0', 'Nick', 'Markley', NULL),
(210, 'stu2024209', 'stu2024209@school.edu', 'scrypt:32768:8:1$2bIvNE9bns9DRoVu$19a43dc6f02e0d8ced943f6ab707f8295aad7a24194cc6f3b32eb7823ec112c8a5e9c93c264961bb70f9dcac03ab047a5a6481d2c29a1c830d2e1c0115c2d9cc', 'Telo ', 'Grove', NULL),
(211, 'stu2024210', 'stu2024210@school.edu', 'scrypt:32768:8:1$znMdU7863WDh44HW$b277a6dcdcb32a5501f1d0665fb396bd1a8afdcb2c902a354efe997524e5ec76c102e0dd7fbcb5dce95d30aaed98de188180dff3a3247c562c8f5014e0007a62', 'Danny', 'Bevan', NULL),
(212, 'stu2024211', 'stu2024211@school.edu', 'scrypt:32768:8:1$J1TEuZBVavzKLQHB$1614acb5c7be367eb4b8fac909c194885fc8059aae485415f38d7bef796ac26a4b480382dfac74e8caf53533b110e4d71363ced6d331d018a1fe918cd09bf5dd', 'Josh', 'Green', NULL);
INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `first_name`, `last_name`, `role_id`) VALUES
(213, 'stu2024212', 'stu2024212@school.edu', 'scrypt:32768:8:1$kKCWv705eEXcAXlk$cbe6970b6acd34a79f84803a1b9faa2c8a46ca7be05505f0512ca54475c93516587c35f6832209c4ef565213acaa8eac09365a2ca7da53b8930722b40960755c', 'Garett', 'Stewart', NULL),
(214, 'stu2024213', 'stu2024213@school.edu', 'scrypt:32768:8:1$aoTxJDaUCRuDGO2A$7764a086082111794ebee0407b8222719b93f4f2f9b9e63559ef596d30641df51176e074115b99dcbc3b9b3f58aa49daa923df2fc8b2d388e75688963a43c34c', 'Mark', 'Bazemore', NULL),
(215, 'stu2024214', 'stu2024214@school.edu', 'scrypt:32768:8:1$g3H48GcMY6XFfhJk$a6cf069dae7e1c70dbd36323ff74898f5227abcbf8ccc20d57838717621b0cba6165ff6942759fc14839ca5a41524a7d7f1a5ebf5c9d43a6d76a0796cbdf7905', 'John', 'McVicker', NULL),
(216, 'stu2024215', 'stu2024215@school.edu', 'scrypt:32768:8:1$UYqJaE3z3cDEaJE6$ddf4511eb7e8934bd312a1f282cc0603169f8e7111f50c6544e4dc7fa81a7e0f7c6f4e46ef7fe59efcf0589cf30296f3380dab68edb06d006af91e2c2b7b4e48', 'Frank', 'DeCapio', NULL),
(217, 'stu2024216', 'stu2024216@school.edu', 'scrypt:32768:8:1$mAxC9qpkm5KLqO2Z$ece1a8b42942402d2d3d40b978622d172875ecbff05899da77a91e9161c823a528bc9daecceb26dad1b830561848b97b1e6a63831598973fcdeb78a7ca6d4d7b', 'Mark', 'Sunde', NULL),
(218, 'stu2024217', 'stu2024217@school.edu', 'scrypt:32768:8:1$df7V25xMDtHEn9K7$1cf9e1fdcdc32dfc4f148dbfa9b138dbeb7b6bbe8e2d38871f803db29e33a394dcd150fe041ae37901bffddd4a7ffa1beb1a6d497400494b9fef4ee10bdfd53e', 'Jeremy', 'Morningstar', NULL),
(219, 'stu2024218', 'stu2024218@school.edu', 'scrypt:32768:8:1$3znkdT1Oe5NZMmEW$405ceb37cec53fa8be4e7c440b11be4f11a67bd2fbede5ef6d42d5e0cdb40b69f9f50db11f061dc32adf10fb34059af105d21e1b9a57a2192682ab45647d2197', 'Jordan', 'Zolman', NULL),
(220, 'stu2024219', 'stu2024219@school.edu', 'scrypt:32768:8:1$6voijtzIy5QrfB30$3c2964c345c745efac36e26c04db25fcd6f3b304fb4f3695e9f001694e09edbcabd2b68ce63bd876b77f69c7294dd199df934c2dacdd8744205fd2f7224e3479', 'Mason', 'Cooley', NULL),
(221, 'stu2024220', 'stu2024220@school.edu', 'scrypt:32768:8:1$RWDZEPJoo82o0XWI$79101488caecb8dece3311c024e1f37bf7a6a9314361633b5cf0c943bb64277f2f88effb49c2c2031aa20124cb530e2b516b4528aef73360b32d33eee9958f94', 'Connor', 'masonfriend', NULL),
(222, 'stu2024221', 'stu2024221@school.edu', 'scrypt:32768:8:1$P4X0Gs1lyc0sIqZg$a7265507820bd9d23f1a6ef17e1f326bc4aade5a368ceb0f8b1f440aa237439586eefb8a4fa50c54bb5cd6e194d3a77194cd83bda983a41978f357eec6f2272b', 'Greg', 'Kinitis', NULL),
(223, 'stu2024222', 'stu2024222@school.edu', 'scrypt:32768:8:1$sqCqTW63QBDOFcGL$9c03aeb9190e07606a92a0181de32910ac5933a405cc1a579c4bdf828f5b45f0b574abc1694c80d9c87745b25e10c6a5ee1d52797ed2ec8dea2b4d2b920c09b1', 'Adam', 'Johnson', NULL),
(224, 'stu2024223', 'stu2024223@school.edu', 'scrypt:32768:8:1$koEiEk4UPgKZcVrF$043042a55e3237825b39a11e78b97015029240b0b0428771db3bbc416d6be299a0517070c125155d2d8df94d12923cb5a7d79967a27ed192c7136676c44c68c2', 'Justin', 'Bonheim', NULL),
(225, 'stu2024224', 'stu2024224@school.edu', 'scrypt:32768:8:1$OsSI0HVzNl1bZiHL$8a40ad79a95111e3f6b2e285c1d9fda3fe3c6791027472a9918caa5d8866111d5a68ae33d09aa47108b5c01f7117964915a9e82928518804949eeb1a4552b103', 'Blake', 'Bonheim', NULL),
(226, 'stu2024225', 'stu2024225@school.edu', 'scrypt:32768:8:1$ldUoNVMDV50QiHSd$488b8e41b1b5e104c3a8f312840170ac09d671bc6e533928dae2f2e8c70b34debe22fc91733082c8bb32ba7f0ff65c6a27780c96129e55d27ed0d47972dcb208', 'Andrew', 'Sherer', NULL),
(227, 'stu2024226', 'stu2024226@school.edu', 'scrypt:32768:8:1$PI9Cs0GqCZBnGEEC$b99f4767a22fbf71502dfca5ac8489993470714ce90199ed4d35020cdb22e1b276294a2b9821dd847e2e40fd2509732a705e5abfda5356f4ec387b61ede72dd4', 'Mark', 'Zuiderveen', NULL),
(228, 'stu2024227', 'stu2024227@school.edu', 'scrypt:32768:8:1$M3NvQbpaaNt1RDTN$d28fdfc6f1a408fc29ee1a96340d8a35a56f106bd9562db98d723eb46041b804a76bcf7e41a893d331183e0b2ea8690facbe21cf1b35cfae6fef0cfa1b29d1d5', 'Jim', 'Ringer', NULL),
(229, 'stu2024228', 'stu2024228@school.edu', 'scrypt:32768:8:1$FXcMJ9MLA4HJ6xly$5943cff459f1b668e1c4e59a686e7067c0bb2d66f9c034889dcca4e3f89cd86766424b2d42466b3f3d96cf86affd5d18a22036eb4bda3f5dc11b469748096a3e', 'Jason', 'Mascari', NULL),
(230, 'stu2024229', 'stu2024229@school.edu', 'scrypt:32768:8:1$EZa3sAOnYWGtpAtP$2b469f189c17d0a25b6c87431926ecca8f3b38c77eb9e4a06bbceca5e01b37e4260ccb5db0062c48204a56d3d03d93b3ce82ca9befb85251396100fcb2d8fb34', 'brent', 'Davis', NULL),
(231, 'stu2024230', 'stu2024230@school.edu', 'scrypt:32768:8:1$xOyftCZI8E29uTpM$6eebbe13e3a0ed4f2d38b3820d3a8d5e26d4770363038085eeffc99ef4413a2a7036cdeffa88706f0c6a5cbcf003293fb86cb90360e524c5346a3e97f2d94e6c', 'Danny', 'Kyper', NULL),
(232, 'stu2024231', 'stu2024231@school.edu', 'scrypt:32768:8:1$wufHUU00gMZPVhga$363511b901a7782625d52ff8c052220d0f0edc0cedbc69a61065f74d529dfae923252a67d134e06784414f116e147ce8d27d55db7c6161c1ca9cba34640dd565', 'Danny', 'Webster', NULL),
(233, 'stu2024232', 'stu2024232@school.edu', 'scrypt:32768:8:1$SwtVnkz5npHMURTH$2d2ce1b9ec6340e5f2d6b54c4ff5997464eaccff6b35fc72aff3f6179c07b5338259f65aead6f5357545a4a6096790634d104ee70f1e8af8245b83687b23bb37', 'clay', 'Febus', NULL),
(234, 'stu2024233', 'stu2024233@school.edu', 'scrypt:32768:8:1$KbJop6JMp7aZxGtT$dbf45afe700837036e317b795c5e0dedaa0dfd2582110a45a6ed18aea2360d341d0581bd20df4186ec8037acb6b4d1f9d5efcbd738d0c0a066cd1f06e7937931', 'Brian', 'clayfriend', NULL),
(235, 'stu2024234', 'stu2024234@school.edu', 'scrypt:32768:8:1$WqvOmYprSjaSlF2R$07f3c59d10e27b57f09e77c4bfbf8f1da43bd8b8dc52b6cbce6c7139ff47641ded2fab8ba166541ed1bdb3d594cd0302f952e63f7bc2bd305c476fc998423913', 'David', 'Farley', NULL),
(236, 'stu2024235', 'stu2024235@school.edu', 'scrypt:32768:8:1$8LkmbF3PUYFq4IuI$926dc0343f5d661182034880d929a74090e885dfba96f73afc1bca722a1c9424809c18f20bfa2794cb2b27c11e081087f06301fc0f9d7deb1aabfb8bf4f12c97', 'Tyler', 'Andrew', NULL),
(237, 'stu2024236', 'stu2024236@school.edu', 'scrypt:32768:8:1$Biry62PVitBqQzwQ$99b2eb29a1df8acee1c040525782c70469d2d42c3c5c9493126fcdd6c56f4c6b9c034da8eabf9a5d8a1977965d0951f00e9b80649b156ecabf61071c7b2bb049', 'Brian', 'Vickers', NULL),
(238, 'stu2024237', 'stu2024237@school.edu', 'scrypt:32768:8:1$Hk0l2oBjaBV6aOW0$0d327ece99068a2f6f903921229be7e087b1b8ffa8bf6ed79596d2886c3d089fa3baa0d01d5734663a5dbc3dca7fa7f00babac792dead1bcdb5d5801c67dd7c9', 'Anthony', 'PIasano', NULL),
(239, 'stu2024238', 'stu2024238@school.edu', 'scrypt:32768:8:1$Vg33y6mKrSUsY5V7$6af87249fa4b70051da773fdb3dc1beeed2917d966afdc4debf86cce9355f0298843c063a696b8de007e1a0b37e8471865749e63ae32ae064da3c5e00531f228', 'Zach', 'Arnold', NULL),
(240, 'stu2024239', 'stu2024239@school.edu', 'scrypt:32768:8:1$WpCQW01x1dIAwpEN$da99d0994f5078c84a6905c13faa063aa98f2bf6142c27578acbc779445bbf1000c81f7e88b1f79e1b02ac227100268d094158c18d2cdebfd6e1be162d99c107', 'Brandon', 'Kaskey', NULL),
(241, 'stu2024240', 'stu2024240@school.edu', 'scrypt:32768:8:1$xC95VJOspOgyEbxx$ae9c9d335299ece7a784b8d8b212ad9579a346dd713b5807db742ae75153151942d29193ea7279f694426d1d7b840450992afb77f10b53fa60047a2f581be1b2', 'Jimmy', 'Kaskey', NULL),
(242, 'stu2024241', 'stu2024241@school.edu', 'scrypt:32768:8:1$IuHmLrRDgOSv7SCo$53fd53735b24bb70cbb7e75fe58de965870fafefb14764a3a58a5008c765f952dca66f169d2df794eee1d499d5fef2ad7ebbadb8a094a4b47f6a4a8f3b5960d6', 'Jimmy', 'Guess', NULL),
(243, 'stu2024242', 'stu2024242@school.edu', 'scrypt:32768:8:1$emIu0MkGXyc4Bfl0$48700c17da24da3e10daeab6fcbdcc5df5962e863889498cfb4c40d8b11e8e240e4ecfd59f65489b41d1de8c924c6f24702f350abf2042929656d85c97dbb682', 'Eric', 'Guillentine', NULL),
(244, 'stu2024243', 'stu2024243@school.edu', 'scrypt:32768:8:1$84yJrFS6Wy04x5Bo$29a5346c2916a0b1a73cf4e8f918b4c538b2bf9cb201c32714975a396740518377eb69a54d75eddc90fd3420273126900e771b6965ca06813c38e513a29bae3b', 'Joshua', 'Mullins', NULL),
(245, 'stu2024244', 'stu2024244@school.edu', 'scrypt:32768:8:1$Xi12w6XuIT1iP3JB$6838a7ebc39926aa1a4d2c8b35a2979665dff4e89d9ab38e78d62a97dad77c91e2c4f763249a602054e5ee5561c5b6fcafc9b085d5cc8aa94202eabda049d81a', 'Nathan', 'Cunningham', NULL),
(246, 'stu2024245', 'stu2024245@school.edu', 'scrypt:32768:8:1$JsXSrsGeh2JtVdVy$77d923e98353504fec9b39db6e802cc3399d7e8e9e09b37dc109975e2fe52be2b5e4dbffd38243c6aa2201d07e0f16d14a46caf9dd370e04621aa10347e2b982', 'Seth', 'Cunningham', NULL),
(247, 'stu2024246', 'stu2024246@school.edu', 'scrypt:32768:8:1$tupFtc45TNxKwmUU$a48e1ea23819e5fc008eef258435a3f9901b69e1bf7d9198d1916113f71c46c03d5bfc4bd4dec379f3db0f60ca3f547993a2648c1bb662ba681dc8dbf5e77cce', 'Benny', 'Cunningham', NULL),
(248, 'stu2024247', 'stu2024247@school.edu', 'scrypt:32768:8:1$HTs8U0WoFsDjfRSz$9751cf8dd7d7d8599ef13b2850c45b1ba3286be55d29a0bc57abab3c6511770dfcf5aedb7f398fff4060ce395f372178029a7e92d191c279e5df1133b7f562a0', 'Alexi', 'Ivanovich', NULL),
(249, 'stu2024248', 'stu2024248@school.edu', 'scrypt:32768:8:1$sREYgOijM8QLFSKW$c51ebe1887b46cb4e39138b81f2e6035ae1e8ef03f888f8006e3553a483c95868ee2a2b8a6dac3ddafcbe9983a310c716229942e5b576725e96b4ebe07375487', 'Ivan', 'Demitrovich', NULL),
(250, 'stu2024249', 'stu2024249@school.edu', 'scrypt:32768:8:1$rEsvFx6y7ILYMNb5$35c175d29d07f3e9128ed2fc7e416ed3a8555af68cdff4e1e3f51ddfcbd2e66d7b1c591209a6f7561c27ec6f14916a00caebaede28ad75b1ddca87d95e405c40', 'Dale', 'Berskin', NULL),
(251, 'stu2024250', 'stu2024250@school.edu', 'scrypt:32768:8:1$44uvrzURrE66n1MZ$82a56dedc21bf081f44442491bb54d3e786a1a165250af195255f97718b54015ddfd85083b4a15c65b016ae25a7220f588f3702817d4ec9b8e549d9dc6923e56', 'Matt', 'Carper', NULL),
(252, 'stu2024251', 'stu2024251@school.edu', 'scrypt:32768:8:1$2BkW5XV4qQRyUvVC$0bc67fbb75e663fe3964fc18749b482800309209f735a1c84d24bd3e5792fbe11a4b6fe134e8ee53f8debe597576902630873d0182574e07dceb5c89be7d526b', 'Jack', 'Carper', NULL),
(253, 'stu2024252', 'stu2024252@school.edu', 'scrypt:32768:8:1$gs6gnRmfr98jDWhT$862c2e6e9b6af6cdbf1d0b8db121d4a976c3c6873d97b4379cf51095863f8df25495dcae2d262a36bf4d2a152fd0db1e585091c60b3a75c5ae6b61c53f199d41', 'Austin', 'Oh', NULL),
(254, 'stu2024253', 'stu2024253@school.edu', 'scrypt:32768:8:1$5Z00pCDMvhPH7bzk$3cf37cc205fd01d0fa7bbea7fcae820f08c10522dbf288a7d46d43b0b9e73a3aa0cd51da9089572bc5244bbc4ba56a13d02d2967c9c2a7d3de0f9a84ba2e3a29', 'Ryan', 'Hornack', NULL),
(255, 'stu2024254', 'stu2024254@school.edu', 'scrypt:32768:8:1$cKq45YH5qZsbgBq2$280bf1a153d52df2520760d419565b666b283b86b85ac65393f563222f057a74a1f79738f3419c950348cf195bb70aa989292721ff8429012a3e5cbf632ed4bf', 'Shawn', 'Baisden', NULL),
(256, 'stu2024255', 'stu2024255@school.edu', 'scrypt:32768:8:1$LaJBRmyxVOTQj7fn$30559ab32d295b4b3f12c1b6cd0cc9f6c2a14479011f26b4bac042e761556549128630927c53f53d087f9a47c6bbd0f5e482f9269f977ed1586419d9559e96b3', 'Jimmy', 'Meyers', NULL),
(257, 'stu2024256', 'stu2024256@school.edu', 'scrypt:32768:8:1$b4d7nCk2H7eutIJg$d04c6ca8d989118864211316768c5a4f8b1137266cad601b90a3b5bac2753934ecd66b209f4fbd7a9fa4efcdcc4b38f94d02d5856c888fbf6e335e7524c0ddcb', 'Jimmy', 'Murphy', NULL),
(258, 'stu2024257', 'stu2024257@school.edu', 'scrypt:32768:8:1$yJFEFl65saILwCif$8089a5735da92210639eb28402a8b998ab045676cd410bc7408964ed7bd106750147c139dbb9393e6dd792ba5710ea7db15a7195c9db6795f64e8e4f5b981957', 'Brad', 'Brock', NULL),
(259, 'stu2024258', 'stu2024258@school.edu', 'scrypt:32768:8:1$RlZ2wGfL2azJVTmY$6138e4fcfbfe1fd076520a3ff421d205d00fbb8132981ff74d60041a6531d27db140e321edb1456fb1a7268be3f47431bef5f5ab69e2e8f258ccc75aa1b97b05', 'Randy', 'Richner', NULL),
(260, 'stu2024259', 'stu2024259@school.edu', 'scrypt:32768:8:1$8JVjvhQrOMvvJoDc$c8fc8bb1e0e9445773293af6d06a843fa4ac799c8820a055e356ce31e901311335b6b1a64a5a8f69fe316bb3dc82ca4e7689cdb35912886d834db3508ff2475e', 'Andrew', 'Witzak', NULL),
(261, 'stu2024260', 'stu2024260@school.edu', 'scrypt:32768:8:1$OoNa5vmxg5tBPVs0$7785fa2def415353cd9774a777a698ee327fb59b3d86e483799b5423d6ad807dd3a562b64daee4dded67e586146aa4266cec6f78a55149d6dd1e0ec0231f301a', 'Kyle', 'Bruffy', NULL),
(262, 'stu2024261', 'stu2024261@school.edu', 'scrypt:32768:8:1$4CY2zJVrBK8aYXRy$3fdee92d2386e1d22add9256ccfe330cbb71918dd46d2d2a39d801bac0f87ff455ec0a4b91f2c3041c81d329c3e9207c54fe5e56f105339518b17f9b19bba950', 'Alex', 'dakota', NULL),
(263, 'stu2024262', 'stu2024262@school.edu', 'scrypt:32768:8:1$PUAoKdNMPq3rrk8K$08ad22ae9c1246db056c11f31385cdf72669388a15074ae252fd3e64090849e9cfc7e587aceabaea5d0267e346ce6ed095c05ad362da684ff48682febaf591db', 'Danny', 'Dakota', NULL),
(264, 'stu2024263', 'stu2024263@school.edu', 'scrypt:32768:8:1$PghNIKdnmyEjDn71$386535167014c070005bb132787b199723837ef1fe117b38ba6c0c8103437aac9f6cf3c5379ca0e017f143b292ca4fea5a1fa09665d13e0d330d2c7e8571436e', 'David', 'Calif', NULL),
(265, 'stu2024264', 'stu2024264@school.edu', 'scrypt:32768:8:1$JynrdGV21H7bsPrO$ad3673da855d001e92828a646f028d28c2bb44f5ee1decb59e8cae7b6f55ac174e6f9f552f1495e2e21530ea89ce7fd2ea7db31d1625a998b381b39aaefe529b', 'Jeremy', 'playfirstbase', NULL),
(266, 'stu2024265', 'stu2024265@school.edu', 'scrypt:32768:8:1$rNLYGj9dBP9y38Wi$da986b144c4fd5d624ef49ae8cff671d871837328bb624ad0bccb123d1b363d3b7a39e5f944999f8e92354c4c989f2f63f23246953b9739439f60e8f54b80b8d', 'David', 'Jamison', NULL),
(267, 'stu2024266', 'stu2024266@school.edu', 'scrypt:32768:8:1$f7ZR6IMEuIErTThz$63f709b27fb6be9e6d3c52369bec56b3263f47b39b4510ce2ba4b0354a3c926176ea123a4d179a16cd7c18efc3af0a48f0c9c962465959143f7057db8dc49692', 'Barry', 'Horvath', NULL),
(268, 'stu2024267', 'stu2024267@school.edu', 'scrypt:32768:8:1$LRFy3WUCrMoZhb8z$8135905eb7a8f9fe1ef6f9a92b6276a752781ab7b50c17d84f5c18c6c334e759bb71b8815f27857805d8055f302409fb199d4a757368e89b723004786ef36dec', 'Marc', 'Berry', NULL),
(269, 'stu2024268', 'stu2024268@school.edu', 'scrypt:32768:8:1$9jplsRb6mv47b8JQ$4040512488d4a9c19178b30d03f26bd2a66f943f31873ccc28271e77edc9d1b05a7ceecd37c205d5ffcd1df7e4d000dde03a07150df24a758973223b826c9ddb', 'Marc', 'Calif', NULL),
(270, 'stu2024269', 'stu2024269@school.edu', 'scrypt:32768:8:1$7xjogg73PLNkxyr4$040fb931a2a17639607e947d24dfd0a01b6b8d5574cbbe7eec106ef00f0934497a501cf6d8a0442a24e27cb11ab3c7ca9b3f59cf035a2d0f55732b85d11cf5f1', 'Troy', 'Berry', NULL),
(271, 'stu2024270', 'stu2024270@school.edu', 'scrypt:32768:8:1$KFTNrV9VQr9QSzLU$fce7103d5a6317e41226e53f68749c78bd3a696c517b33d8b71841e60fd6e51e0e46a87e2eec903790313efc7d95b461622456734e7098bbe007700387a10df7', 'Kyle', 'Chippewa', NULL),
(272, 'stu2024271', 'stu2024271@school.edu', 'scrypt:32768:8:1$z5uVWSMeDFqqL7G8$68467704b294443b628fec9af5609de0292467fee2e90368815e011b784b44255dda8c9cb6f9adf31ddfbfd067743039ceb75108cac5fb50de8d80fce9ff2e26', 'Matthew', 'Lacrosse', NULL),
(273, 'stu2024272', 'stu2024272@school.edu', 'scrypt:32768:8:1$DpRcwrKWyfRErFt8$25b57428a0e9058cd9a522cb289286db9ba080bb68223f54bad01ee81b2a41cb9b95dd8de861ae30e93686849f9b8928ae786b3b7626c809396f351b301304c9', 'Derwin', 'Loverink', NULL),
(274, 'stu2024273', 'stu2024273@school.edu', 'scrypt:32768:8:1$fpFd4ZEHxSnvtLJa$311f45e6d0995e6878e8ee4c8f2c84d594d5eb13bab5d13ba255e274332fb3ef544213412fdd6509d3bc03e170b8a606e3064e543997e61f9504ea666a2b5e5f', 'Peter', 'Loverink', NULL),
(275, 'stu2024274', 'stu2024274@school.edu', 'scrypt:32768:8:1$9yzMh2Px2RPuFfT8$0a90ce5535a2697fe0cf153ac6bd3a27fd7f8bb560e097b904b7b66147337b4db1192844e5ac10d92397b6bd4d6ef57b833ad634b1982e4d96462e16b443fb0c', 'Aiden', 'Loverink', NULL),
(276, 'stu2024275', 'stu2024275@school.edu', 'scrypt:32768:8:1$4qmv9IwZR73Ta3Um$9152a526c6e77283651ceffa0307ab5830e7fc0f79018333d873840be0df74d93437fe4d07b9f85c3ec1d1c9967ec419f803a6ab196565e137e3c755fd6a6e79', 'Gordy', 'Sanders', NULL),
(277, 'stu2024276', 'stu2024276@school.edu', 'scrypt:32768:8:1$O4BVOOY5t06td0F9$e2fa8ce7a2d7892ea44855d3cadca2eac6cfe9ac627989a497265d8ee9df5cf66f32742da584f4ad23480d4e5b2f366fde42215a64e9fdbd0fa6f37556e4b0a5', 'Nico', 'White', NULL),
(278, 'stu2024277', 'stu2024277@school.edu', 'scrypt:32768:8:1$HCkDDEnaT4P3Hwz2$d12d443aeeae0dcf66ebb32d44c82447cf27c23ed1f710d62d3877f8e8b92d4adfbd759a91c6cade82f28abaecc80d2c7305895e5b07d47eba24afff05bca08f', 'Tommy', 'Brady', NULL),
(279, 'stu2024278', 'stu2024278@school.edu', 'scrypt:32768:8:1$XBcO08qlMo09haeP$373c6484bee46b499e6c4495e96a0f6cf42fd45717fac1e2ba7c98e9db4f2bfd85cc3847b750383493dec09fd9fec95a319b2dfc80a52ccd6df31bbf37db0e2d', 'Aaron', 'Green', NULL),
(280, 'stu2024279', 'stu2024279@school.edu', 'scrypt:32768:8:1$4z9pRCK70CEjiK0H$b297cf13365210ec33f3b52c24b9c9a1205a0d29a19e61bef66d0c3c94db55a4efe3e4fd162792e1f73c0ee51625bc58ed2616d631b1acce5f0c1f7329c28417', 'Mike', 'Long', NULL),
(281, 'stu2024280', 'stu2024280@school.edu', 'scrypt:32768:8:1$c5jYVxWwl1DUHwg7$bbd3d8cf611a3e1780444e3c16535b37ad2a58ceb78c521471756d5f5849344937c0fda4a54afbcbc33e22dc2061816ba48bb6852984d744bfd6ed62fc55cc58', 'Mike', 'Cole', NULL),
(282, 'stu2024281', 'stu2024281@school.edu', 'scrypt:32768:8:1$byutt3JpOcJ3VkYd$c6e98876a792382de33ae3828db0d60dc29543da09cfa1e60f9c991cac9a459ad704eec6fb9a48ada57d64cd6bc725f0e397a9f6bf3c987e3b4950bf51315673', 'Jordan', 'Grills', NULL),
(283, 'stu2024282', 'stu2024282@school.edu', 'scrypt:32768:8:1$SgaNDhW1GkbQvDDF$ee08f3d1ebfa018004036fd204a6dd0efdf6ddd11c3c823ad7ad90dfd9866e0abfca21776638ddd5d2fdddb7f6ff5df05b2b867a85cdb09d4973d9dd3268a0e4', 'Johnny', 'McDougal', NULL),
(284, 'stu2024283', 'stu2024283@school.edu', 'scrypt:32768:8:1$oPHVLCuJmISGaSZT$99a607bac00d328d2db8f5115e7ea5715927c2780ae72cafd35009053db2291e1546194a3791ea81332f83f1bfbfcc56992a45478656f87b718c12630589bc4e', 'Steve', 'Brown', NULL),
(285, 'stu2024284', 'stu2024284@school.edu', 'scrypt:32768:8:1$KH6AtVTRVPycfYGH$cc54532abf328569d5bfb5fc438ac840125f3d4023265d528c1a3701b45e36250011489bd32a252316fdfa276f67725e31a44f4b67f41a2d6908788509f82e2c', 'Greg', 'Streme', NULL),
(286, 'stu2024285', 'stu2024285@school.edu', 'scrypt:32768:8:1$DXDTRGsrccVuherB$ce137f60e9b9fa35c9a93d5ba79bdef8d672123728b392ceb4d17441a99416ec8f056c77640a0e6eaaa8ef4026b534221b78d3255a6bf3eaf7cb65af98330946', 'Abdul', 'Gassed', NULL),
(287, 'stu2024286', 'stu2024286@school.edu', 'scrypt:32768:8:1$n1SU3mYDZdvZUcpJ$bff62e6065a2a9591d123ddaedd53c5c594690bc657661bf06fb7a5eadafd12f9fb7199a5864a89502f989682e342930639ca284b5eb06b5f5bf32d1517f9c99', 'Greg ', 'Cornelius', NULL),
(288, 'stu2024287', 'stu2024287@school.edu', 'scrypt:32768:8:1$9l3FXeceeqVS4hLh$f50649ec7cf60687eb68106cdee0ee098a2cb725e1ac7f0dddff20a8ffc934f2bd5a4eb011f5fc5d3c80b0b7b48b6d9fafa6a10c2c24ce80f2ccff80be06d2d7', 'Bobby', 'Pembridge', NULL),
(289, 'stu2024288', 'stu2024288@school.edu', 'scrypt:32768:8:1$KDGbhQoiPSsaGSPf$4d174ce26ba4bcf01776b5aab3e0c7e1cd448adfe539e8ad4520415fb1b1f6285f5761b67f34447c12fdf33ee23a7081360731e8e4393aa75dbbbc532ba8f31c', 'Tim', 'Miskimen', NULL),
(290, 'stu2024289', 'stu2024289@school.edu', 'scrypt:32768:8:1$lVQD2v8uloFZhKjh$0a7e42120bea0fac8fa11e820cc6e11761200c568df82941576e6060c9293dd3b1f79255942ad7240ea6ee314389a92880fdd4c7e1973847f2cf6a8d2ddcc477', 'Ryan', 'O\'Callaghan', NULL),
(291, 'stu2024290', 'stu2024290@school.edu', 'scrypt:32768:8:1$p2H7H1OhVXYbNSNR$f6ad50442f6050b4e96fd3bb274ea264327b1a0deef04cfdb618ea0736e81b2f5c3b8e7920a3023deb8db642a0244c0ba1f03967d2faea66f78dc4bb94b1b0b9', 'Eric', 'O\'Callaghan', NULL),
(292, 'stu2024291', 'stu2024291@school.edu', 'scrypt:32768:8:1$bQxXbsZleS0yjWPg$2a8d80eeace6e7b85116abe65619918300497709aba21fbd35b9017f746843e34758498b691e8af1a27c4004a167f4625ef70ef30245767379b20c1464883303', 'Codi', 'Schmidt-McPhee', NULL),
(293, 'stu2024292', 'stu2024292@school.edu', 'scrypt:32768:8:1$mB0SU5AXtvgfjdWg$33ca0505a3368f949595d555df6ad34c20dc47b52b813a37b1aeb7bf5d2b99a9e2d4a464749960b8512403b697ff36c54566defaf4f4735c04fbaf9d6c4a2f77', 'Ty', 'Sheridin', NULL),
(294, 'stu2024293', 'stu2024293@school.edu', 'scrypt:32768:8:1$GEjTnkpb6sgdZC2e$a47ad45980eacb8bfe4d943cb4cec4beaaf3e3e6647fd9dcca2431ea93908b36e29ccb665e5e4e01537bda8205c86767606a937439a20e8e340ab7334ceee994', 'Jacob seth', 'Loughland', NULL),
(295, 'stu2024294', 'stu2024294@school.edu', 'scrypt:32768:8:1$UWanNfacb7O7yH3d$d610bbdaa5712f233c85897ca9e845a4ac83f3dc869ec9764d1d0a70be469e54f18d99064d850fe33b691b78f7dda79101b07cbba8c300a403f387cf40e8bd7a', 'Seth', 'Clearwater', NULL),
(296, 'stu2024295', 'stu2024295@school.edu', 'scrypt:32768:8:1$IDZvl2dnBdMlOKEl$db579e8ba61148c62af8c1566664fe3a61479b18f5cb78a391b9bb3362b6558ddfd02f7f33d6242cefa6357f6c330d8c135d0839da04a117e7873c22348ceb46', 'Thomas', 'Brodi-Sanger', NULL),
(297, 'stu2024296', 'stu2024296@school.edu', 'scrypt:32768:8:1$7f6uOl3yby3ts4cp$cb6fef12898b6f891374601827fbf78f138382989156c73bcc74985b5781f8f3c47f14cc9c6806399c93a7780cfb629159958ee9c43907f071d7c9f304e1f6ba', 'Mickey', 'Matson', NULL),
(298, 'stu2024297', 'stu2024297@school.edu', 'scrypt:32768:8:1$LCV7VbYt2WN2WL74$a334381f48f02a175f9ae934ca4c9d26b68a0b102e2bdf402996b23d8f8675a1b0a0e602a1461564e7fdcabee6eac94581bb0b6e11e2169cf0547a10bb21aee7', 'Brett', 'Portage', NULL),
(299, 'stu2024298', 'stu2024298@school.edu', 'scrypt:32768:8:1$eZpYURQQMLZofyPH$4eafca0c24f41a4cca16a703f90401b642152bf3c795ab4441cc8d0342acac080e5f5d2695490b858b4ec766e404d4a13054ac662624c703abc7f8c89e236d73', 'Brett', 'Nau', NULL),
(300, 'stu2024299', 'stu2024299@school.edu', 'scrypt:32768:8:1$bLlot4Obwn7HVsOK$83bdd0c6d9d394ccfe945ae8be03f05a89c54e9fcbb8b175d80c3448505c5ce10a27942534a182c7c5987d6eea0cdd2d72d79a2391bec4b7cd13f79dfa4d1408', 'David', 'Wright', NULL),
(301, 'stu2024300', 'stu2024300@school.edu', 'scrypt:32768:8:1$CR3VisrlZZe52ZLB$e843dad4c82e3a738132585c4eccbf9fda25dfb4473cfc515df8652d78b5a461b4c1e3c47a0979f012286079fd056f74439a5284186cb33cb97bfb34615e4b95', 'Frankie', 'Suthard', NULL),
(302, 'stu2024301', 'stu2024301@school.edu', 'scrypt:32768:8:1$AliSRlrBmSVuXJVD$36a0fce325d71abc268a90d7fe0523a2825c22404d0dc1342d7e43f4ce7424995b6ed3de2bd619128fa45c829e93b4874ba673ca942cfac4fb98a48e1e1d8039', 'Cody', 'Suthard', NULL),
(303, 'stu2024302', 'stu2024302@school.edu', 'scrypt:32768:8:1$Y9WFusAQObEbqRvc$97631fa7f2786691c59ec49f7244b491f55d15ae2dec46c8877ac064b5321241e44fe7c3ea73e7f4a0c1ce2aadb7c64ab856b3962c8ac8cfbd03f8b81d2dbf67', 'Jase', 'Suthard', NULL),
(304, 'stu2024303', 'stu2024303@school.edu', 'scrypt:32768:8:1$jXzWentGAXRMOI87$d288d0e4a0410bad5a76b8221eada8d7adce1d1109a711b6c5b6a239f806e2b621d0c8908110a25c3684cc84f9c7396b58b704217a5d0e1787f9a8a7884622c5', 'Philip', 'Smith-bros', NULL),
(305, 'stu2024304', 'stu2024304@school.edu', 'scrypt:32768:8:1$ZDSoOuo4Fhdxs3SZ$e76709f8956744808e7887079b3e40fe60cf0f1612cea282332d97e53d6558fe8d78a20d93d01fcd05b01ec301cd807cdc803334196f99be7d5246a8d0e6c6e4', 'Reshet', 'Moti', NULL),
(306, 'stu2024305', 'stu2024305@school.edu', 'scrypt:32768:8:1$waaW49idhqvjYy2z$ed8fdd78029aee867359fdd01320ef4a4872d0e434e34039580f6ba121cdbace7b6d2866ce8b01ca75a3c46b54b0044f7e745d807595a45e9c3fb1e009f44f07', 'CJ', 'Scout', NULL),
(307, 'stu2024306', 'stu2024306@school.edu', 'scrypt:32768:8:1$yCjWrAgtx35yIQcQ$9799448f9164a7583b32647e021bcb91c7852889be1176d73d5f550acdfe72239ac74218541c6d15770050a73fcc167d9281e59413709c3e56b61598e4b67cf0', 'Caleb', 'Scout', NULL),
(308, 'stu2024307', 'stu2024307@school.edu', 'scrypt:32768:8:1$hhhIHOlwvNpqTMsu$ec6e7d46a883d7a2c1944d8e1e0da5c31fb129dc9876a8d1fb3445bdfd4e0c247c720c3d72d1cf5179a50f97e29a5a57bc96bbd5fed96e53b69958011b03cf81', 'Chris', 'Scout', NULL),
(309, 'stu2024308', 'stu2024308@school.edu', 'scrypt:32768:8:1$qWurCgyXYy9pvXvF$72a507e4cb5f3563324ca138b4bfcfe6198b3a1d356d5eb55cdd141734a91f6d4297e1c6fffc3ce441a92612b79ab2e29b7b47708eb2d513599a113ff0559d59', 'Misha', 'Hotel', NULL),
(310, 'stu2024309', 'stu2024309@school.edu', 'scrypt:32768:8:1$fiZuYzragxgedN8k$0495c778d9d2323e29579e1c37b553da1e7933abedc8fdbac5b012e8db5ec91ce2c7e88e66461b94d11320b6b79aa6e4c1ea0d5b9fa9425862ca63e631132cbc', 'Matty', 'Aussie', NULL),
(311, 'stu2024310', 'stu2024310@school.edu', 'scrypt:32768:8:1$P1aldhaNCY0jsvMF$c635585c7f08283fd1a836fd9f77daeead44f9f4145bdfa9b42f820f852c29601f3f0944c4adbdc66f8eb852061928c4019fe2011de816f2334fd5295220d122', 'Julian', 'Aussie', NULL),
(312, 'stu2024311', 'stu2024311@school.edu', 'scrypt:32768:8:1$RjcxUBolSAaacyMw$67d3accf0c2cf9ee66d54b63a03ff238413cefac04b4f48dc1e265a368ae5c9fc726667f498abacba430dfb3977aafbbf8507080bb6102609fc6bde907ebab77', 'Mikey', 'Argy', NULL),
(313, 'stu2024312', 'stu2024312@school.edu', 'scrypt:32768:8:1$Czg45ocUVT5R2YQo$e2a0dcb2609a12f22525760a3820ff6edba426e09e1d10d7b10942165d7f128c2ab183b93ffc7f126ab4bf6aac4a6b36e0cb1bb43b46307a250cf04dc0fae6b4', 'Sandro', 'Argy', NULL),
(314, 'stu2024313', 'stu2024313@school.edu', 'scrypt:32768:8:1$UKUI2lYz6Q4XuORJ$c6a88b9724f0564b3b24eeef53a835e7a83540f43c7d6a83464915f7ed0d72c96e0b953179052b4a4faa284da67704814c5904b1eac913db03f558eee29ba4b7', 'Jeremy', 'Kocher', NULL),
(315, 'stu2024314', 'stu2024314@school.edu', 'scrypt:32768:8:1$ll0xcBDw5XSOKuhc$452d0530aa4491ab1a9c36bd8ba545dcca541c7df84d0bc1125f75deca7aebf42afe603402eb998894d50ec022d83d911f23d99dcab170ea74930178c4d4b39d', 'Zach', 'Kocher', NULL),
(316, 'stu2024315', 'stu2024315@school.edu', 'scrypt:32768:8:1$BniFUauzdB6LMeGs$d377897bc71abbc8f8dcaf69fdaf668d0fbee57f45a43d80637342cf9764428d5a3df95b6eb41018b07406ed4996372cbf2f5c3377ae73087e07fd92c6e85654', 'Gregory', 'Petek', NULL),
(317, 'stu2024316', 'stu2024316@school.edu', 'scrypt:32768:8:1$K0G0tuhOqti6xK6u$a84913ceff5752367cb39177136165876687c5d54cdf08e108f830d3e48d0f6b5c4002f227d5a33f0eea46b922dd118ffe27a7ac47c0cfad0c7c02e2e174a3d1', 'Thomas', 'Petek', NULL),
(318, 'stu2024317', 'stu2024317@school.edu', 'scrypt:32768:8:1$RZBnkhOs8Qnzd0KR$bed9cd556ff82dbb7a125a5958ecc4ffe7c788d337fdfdca18a84df15d76ac7e805586081bb83b41e8e6bef1b20db5566f497fe6e9d3f82d523b61eda0021519', 'Mark', 'Regowski', NULL),
(319, 'stu2024318', 'stu2024318@school.edu', 'scrypt:32768:8:1$mctrbPELsFCltfjo$7a4526573d3ddb2a6289b4b1f9e0abdabbb51005059895982ce98faa5e435ab7ddfb90f04f6762ae22e99e0e56294d1deca8c153b1e63ff26d7cb1e07b1452fb', 'Randall', 'Bolinger', NULL),
(320, 'stu2024319', 'stu2024319@school.edu', 'scrypt:32768:8:1$RtIBoiMaZ720zpxt$a66b39485eb2388f9b0ea9e8b13b2fa406966db24445d64ff9c48f55954ca5862690cda58ea9019dfc1497e25a23e44e821ebd925b71b0b1b6b2495c3e463f7e', 'Eric', 'Larson', NULL),
(321, 'stu2024320', 'stu2024320@school.edu', 'scrypt:32768:8:1$vjCYnBYUmJRhXTwN$54c095209bdbd969e6804c2c5b4fc2bc8b351774a58a407d9492ff275c350cab9b8f51ec6fe6551e0cd4b616de9820097f909d8431a0f83e66aaa23a1db51b7c', 'Steven', 'Larson', NULL),
(322, 'stu2024321', 'stu2024321@school.edu', 'scrypt:32768:8:1$Wfa8QH6VeMhq76Rv$8b53dc4b4e7b45f6d4f9e21af516de1d70483a222515e1af595d112d0ec319f15ee11dfbcaf475ac44ef3ceb69d8e3d093f7f38136148cdbdc27afe578abf9f2', 'Carter', 'Bratton', NULL),
(323, 'stu2024322', 'stu2024322@school.edu', 'scrypt:32768:8:1$WamnYnnUgsdkVRW5$ccf2d73ee86cb6e2c167b46f610c595481fcd7acfb4e83926f674e2376bd7a234be475c9fa26f2169508cb4300c100661854431e139b97732619730db5a605ef', 'Rotem', 'Mathias', NULL),
(324, 'stu2024323', 'stu2024323@school.edu', 'scrypt:32768:8:1$W1KpkFRbyLPGZEsI$c30010224b300d639762ce888876b1f747873e519159d2f7b6f63ad613a41f91061cd74ee786d5f026aa3852b8cd0324ace4717c7c8a4e6ac2aa8b332ee29ec5', 'Erick', 'Johnson', NULL),
(325, 'stu2024324', 'stu2024324@school.edu', 'scrypt:32768:8:1$0bfr2QjClPieHiQz$6f2cb3309bdabf5807808a4912056f0a77a975af1de1c1b38395f5a597294341f4942ae952ee22a240657c5f87065c8889415d61f8ffdcc742474c6464531e65', 'Jacob', 'Wetterling', NULL),
(326, 'stu2024325', 'stu2024325@school.edu', 'scrypt:32768:8:1$Nm8Eb21YlmBQ0fVA$34670df43ead9ff7483f3ade79188f49f409c41ea71fb044fb7353288c41e9e2147cf7b25ad162513ac686cd48c001b2e0429730c464fb95845fc36af877c16a', 'Tom', 'Daley', NULL),
(327, 'stu2024326', 'stu2024326@school.edu', 'scrypt:32768:8:1$sBki7pWlCHuKQmF1$0525fc79c55d51eff25c0998002a375ab1beab86ab13417eb01f556c0b290e8ec1208c193de68aaf82ae6e64cb04d2ead191b673170201830722733834c17311', 'Tom', 'Danley', NULL),
(328, 'stu2024327', 'stu2024327@school.edu', 'scrypt:32768:8:1$6UCLH6HNOYIRoku5$8cb67e1d59cee1e991395ae653959854a97cbf197889a9b9dd4382d5363c9cb5f3e1addcb4444ec1a5302bb423c2b385f10d2547e643bec44cde03d31483c298', 'Brig', 'Miller', NULL),
(329, 'stu2024328', 'stu2024328@school.edu', 'scrypt:32768:8:1$E5U7DBrXZBKd6gxB$a9074660bd7b3d3c67c0ba4c23eeee263ea76c504aabc9d782f714d5ae23a4a26bc7ca8c1ae8f8924613be0ba588d00faccbeaa47fab3d07e800929188638b4b', 'Dillon', 'Weisler', NULL),
(330, 'stu2024329', 'stu2024329@school.edu', 'scrypt:32768:8:1$O4b7w4rXblojqcP4$3a35ba2ff576806fe333f5e2edf61181e924b241f5d2aea515c182de829e676bedbca861114b1ec80c88f4223b6df96037e969cef4da676fc71ed47790114b84', 'Jaden', 'Henline', NULL),
(331, 'stu2024330', 'stu2024330@school.edu', 'scrypt:32768:8:1$2GJoqqlK6Ann5fdB$d84e58444b7696861728a6824f2f2ffe0a5bb383ba3e936a766d1db0b68f8e353e6d0cedf45127597b13b6109564e462cbe02f44f6c56bacee060b7c40cd8972', 'Ryan', 'McManus', NULL),
(332, 'stu2024331', 'stu2024331@school.edu', 'scrypt:32768:8:1$MFCtNyD6klU07GFK$7ebd0da6957891c60234dbb1dd23cd98b245ae7435f54596e6d0820f5f7f8d0be2ccc7c3f18d371460818a612e121200aff167c2139fabea5b4bff092118b035', 'Jacob', 'Miracle', NULL),
(333, 'stu2024332', 'stu2024332@school.edu', 'scrypt:32768:8:1$bMJlKO55Nm3CBplH$bf1abc8ba09b89126d39636d5f0fd3483cfc713ee602e8686008f42f9248ff4bdcdea8157f64c89c73c3e1ba401bc36e1b851571f616d93a7a9538b3ca543e24', 'Aiden', 'Bryant', NULL),
(334, 'stu2024333', 'stu2024333@school.edu', 'scrypt:32768:8:1$vgKpRCs0mghYVUIn$0922155131fcce091a20ac790c06e64c97779d59901d2917e144f6a535de01c3b28b33957b97912a60d21812ab9a68d397e850d25e8fa257d6e188550f1fa7fe', 'Bo', 'Folger', NULL),
(335, 'stu2024334', 'stu2024334@school.edu', 'scrypt:32768:8:1$mhhxDH3maRvesCmK$9e8a37f15851197040f8fc05edd266ac7955ebe16fadef7bf262c775ac616290b255ca1ab7d2a057869d6903c58b93025c3597718b57336ec8bb5eaa84690a53', 'Tyler', 'Folger', NULL),
(336, 'stu2024335', 'stu2024335@school.edu', 'scrypt:32768:8:1$ZZVrJC7xzu5jtdw5$9f0714e9f1dff5c760815792d49025c4ab7fd8b0e58ae7bce13b5e6fdc531cc970b927eeae92a036ca986947799474b73ed0a8674fe15b5890c5caaad5deb6d2', 'Lucas', 'Folger', NULL),
(337, 'stu2024336', 'stu2024336@school.edu', 'scrypt:32768:8:1$cVChPg4Zfann62Mz$6643f9f93657fa261ad1db5d0d3a65fa9f68b983652d23157af534c0936af95389f9e87ffc748283d2e1f80461b29c589e9e69838d8b18f886985058d80263d6', 'Cort', 'Oregon', NULL),
(338, 'stu2024337', 'stu2024337@school.edu', 'scrypt:32768:8:1$IGguN4yaUekBvQ8N$3cc84167053ad2de229dfd217a9b3d2084a1c4530bb953b9adc373dc407cf2f33bbf9b87916266b7fb405e20b7031e7e98c797aca1a683a0a4b49cc2ae8481f3', 'David', 'Whitewolf', NULL),
(339, 'stu2024338', 'stu2024338@school.edu', 'scrypt:32768:8:1$8wJy8kL6dB2lQjnL$872ffbe531afe9c02691a4b249e58996b4267def52db900d8eec04423aadb0a924f4aaa3e3a25570083a31db1a39aa2334b5f4dbd6a909d033193bcf60b81d84', 'Ralph', 'Marachio', NULL),
(340, 'stu2024339', 'stu2024339@school.edu', 'scrypt:32768:8:1$jAxNDiwrwU7f3vSL$e3fd84e544b420d67fdb3f1f8f4780abfa23c405b33aa60361afc05f9c2459aed1b4c6e2625ef287eb159d40474746d8389ae0cb1a7e61e8a00b3daca8515371', 'Devon', 'Sawa', NULL),
(341, 'stu2024340', 'stu2024340@school.edu', 'scrypt:32768:8:1$NAtXokpnuqGtFIZz$454bea9384ab691b47a7980861f4ebf5ca3e1f929f4825aae9a1034d364479d5eded65456f8454267df131a94188708e5f019a931d8d054e11949726946517e9', 'Greg', 'Xenon', NULL),
(342, 'stu2024341', 'stu2024341@school.edu', 'scrypt:32768:8:1$qsDsHJFGgsRiW5Wf$0fea65d63209116c213c78560e2ddc09cc958224c00e46eefc43ca2c190dd4782b3bfa34cef9d0faf590c70b3c83d9244930846f7cea32a4d024bdcd2d39eddd', 'Robert', 'Irwin', NULL),
(343, 'stu2024342', 'stu2024342@school.edu', 'scrypt:32768:8:1$Wavrp3oVlcVCXkJq$a3f5f2e59605b2aa1a4d62ee20c6a3911b14c013f0b0761eeff8461a7d586f8f1178dae5413ab1e8c48b6177954089aa50ffba18593269f74a122aa2a124d83e', 'Drilon', 'Sadiku', NULL),
(344, 'stu2024343', 'stu2024343@school.edu', 'scrypt:32768:8:1$v7CZYXU2b5TlWenv$7f0858575584437d119938caa708e7002b9e929cb1481374afcb4fe281b91c46820b32151ac03d9e7982fa21f7616514604a118427a942cb00bb0a61779d10a0', 'Drin', 'Sadiku', NULL),
(345, 'stu2024344', 'stu2024344@school.edu', 'scrypt:32768:8:1$Ns9UusRH3lYX3Nnv$7ca8ed52b359fd209b58bccc62e5c3c354018adee3247fd11a9a018156803b7b6a4f7cf7d180090d32c66fc13ee8f3dbdfd447f80b22924aeeb5b65a442afe8a', 'Lucas', 'Wallencheck', NULL),
(346, 'stu2024345', 'stu2024345@school.edu', 'scrypt:32768:8:1$4S70fzmxmDcX0mH0$7ef4654f9f2fc5955ba6bf93e44b0fa9a137bd96cbb46249a56ce052d5eacbb323c688963271be53c2b7991c54bda0773b15fb63d4ba3ff4e115dfa32325f084', 'Brian', 'Clouds', NULL),
(347, 'stu2024346', 'stu2024346@school.edu', 'scrypt:32768:8:1$dcfufrecibyXgDHA$32b755fef17c41c673e2d3479259c6112eb5c3944064513101f7c5f4229add0783ffdc6201a84a0abaa92fb81e06e06ce63c806990e4f2bc4453e5c07e54dd1d', 'Charlie', 'Bandan', NULL),
(348, 'stu2024347', 'stu2024347@school.edu', 'scrypt:32768:8:1$XXV7gFhZQbjO6x6p$9c3fe4620d443382b6c76bc1b7642c8a1542f6f7042ee52b786d88db6a4b64acf6a6c34bdfcd81b781e46d920d2882bb9b3fec84fc269836bef91dcec9284a0e', 'Tyler', 'VA', NULL),
(349, 'stu2024348', 'stu2024348@school.edu', 'scrypt:32768:8:1$Kzey3YPFK3nn1g0M$a5775eefb33828ac29f629ecd96e3fe572846c0e4f7cd0b4c62cdba06d9bbb803bc7987927cbf3c3e1dea08a1eb452786159615dc2701662c62b5e5dad0fe8c5', 'Grayson', 'DC', NULL),
(350, 'stu2024349', 'stu2024349@school.edu', 'scrypt:32768:8:1$QV5GAuCFZKEi1ubS$7e70700ae3d63c0ab1071d4bea8806ffcb2f98e1d75c924da9c08103a50ab8f6715e96f39fc98f09c5d38e7765bf90b4a9cca595282f72ea5a753598bf08d081', 'Tanner', 'VA', NULL),
(351, 'stu2024350', 'stu2024350@school.edu', 'scrypt:32768:8:1$yFGizqV8vUq8UV3R$c2a88aa514b6fb8307518a7b3145fd323fac6bdb7b85cea392437270a012fdd31bc65aa954fb8dada96e2043795fe67c2df3a2cf9fcec9786c94d56d4d208507', 'Taylor', 'Starr', NULL),
(352, 'stu2024351', 'stu2024351@school.edu', 'scrypt:32768:8:1$fmy6rkcUXc9Megbn$6cf5c840f0519b11a1267b98d72d541f12f6d9e8700592156d2a3c9411894d00a5fb40706175b2a7e79b872b9a26921d7299b95e9d9d7654fd27c6f90cd9f4d3', 'Hunter', 'Starr', NULL),
(353, 'stu2024352', 'stu2024352@school.edu', 'scrypt:32768:8:1$KHs9nT3SxKyqwNb3$7df04918d89fc8e961d19364a8cf667480a7a3f8139caeab48fc589e43c7badafc0fad5d1d9a33c7e88895ecda3798ae89ac9bb3b53d5eb978d917cb7a578d67', 'Thomas', 'Tex', NULL),
(354, 'stu2024353', 'stu2024353@school.edu', 'scrypt:32768:8:1$7gciyimTK5fWAvCF$87cd122a5597449d1490e6332730a0774f955b2f349c7c4a821f043cdb6b238fe0ab4632139cb99d7cac8cc4bac942664e28ce3512207f6262fee3d9b8f61f33', 'Robert', 'Burroughs', NULL),
(355, 'stu2024354', 'stu2024354@school.edu', 'scrypt:32768:8:1$XI4oz1kYqSQGsRBA$2873816d0503e7d2ac66323d20b08a438d21d01869fdd1f52750f0420baba1bfd3b1a6257f65513d206c19dbac9f3553254625d2d128641fbbb321f19bfcf5e1', 'David', 'Anthony', NULL),
(356, 'stu2024355', 'stu2024355@school.edu', 'scrypt:32768:8:1$EG0M1V8cNefwFPTv$4d93dc668ae835800d219be6f2236d80749ce85cfc5ccb09ebc01987f83a043141e3cc6648e4f64f85160e50331b08b04ea748a034fdb6e7ff4a40c6c161a504', 'William', 'Blakeney', NULL),
(357, 'stu2024356', 'stu2024356@school.edu', 'scrypt:32768:8:1$TOwoELKk3eUHzsG5$69f2955267c1eb2cdb4614e77124ff9d1ba00caf3d91dd7bce009ec44f83f575139b88a5740c5704af3318a2799692b4b41621b5c003974b5676de179ed98e04', 'Philip', 'Model', NULL),
(358, 'stu2024357', 'stu2024357@school.edu', 'scrypt:32768:8:1$jkRlO9mrmlXGutWO$08d553f9d693b6ad693c4458bf4230fd9c90c740bfec93f6f17d6b7a658fa8632cff8eddc30e7b39125c7ab62409dd9dc171d9512ae113c85cb5c9b23e8ce059', 'Scott', 'Allen', NULL),
(359, 'stu2024358', 'stu2024358@school.edu', 'scrypt:32768:8:1$pLMdEcAz2h30ipNZ$7557c3fd6df0069089b271013137bb9f69589b28f36edc17828b8b487428e12a1f8a9dc27643844faf8217dddf062234bf293b2e9200769a5db7505f29f39058', 'Scott', 'Drummond', NULL),
(360, 'stu2024359', 'stu2024359@school.edu', 'scrypt:32768:8:1$XKbjgbMmDAOYyHGk$b5a83d135a5fc923965203d0ed270995e63fd5ea8de3527c71f54b58055c4bb494c4580af90a810996188e557c02374d1bdaa00b1fa1c1991681d6ac3cfaab12', 'Ron', 'Drummond', NULL),
(361, 'stu2024360', 'stu2024360@school.edu', 'scrypt:32768:8:1$SnFoiCUVqGccavOn$ab12ae7772c7bc68cf63218c0f4622759039cbed1021f68054e4f1c9a144689a777a1c7e64bc348ceb3766f3fd8f5b4eef1da0f5f3d0fac07e5cc2d9e267e903', 'Brett', 'Klauss', NULL),
(362, 'stu2024361', 'stu2024361@school.edu', 'scrypt:32768:8:1$c0ctZbIejZwiQpYs$a01f21ed5ce855a9e9de159fdc072b9fea195e9065334c857484f873ff0cfd18bba9aaeadb06406c211b2db9a84231d30bfb63de5a4d219d6f028f7d0a853799', 'Jason', 'Klauss', NULL),
(363, 'stu2024362', 'stu2024362@school.edu', 'scrypt:32768:8:1$qKbO4OTJe0n1cgvq$d8c36cab554b3f72b51fdea5a3052085ad1a1a27cdb3a91aefc3b685b07007b783dc6fd43b29ec9c5f35d1afd687122743f435b8d77e36e1b9daf36b4baad7dc', 'Zach', 'Garner', NULL),
(364, 'stu2024363', 'stu2024363@school.edu', 'scrypt:32768:8:1$Xyb9JvGNWrhDPDUi$59087c7f7667d2352b74a8c37f6c96c81b3b3d1f699ffdc8931f2b8cb32c40c69237d86756837768a7664888d3bc4babc604fab3ac1f96ffde1d2904b5768471', 'Keegan', 'Garner', NULL),
(365, 'stu2024364', 'stu2024364@school.edu', 'scrypt:32768:8:1$AmOksuyqM1qvxf6Z$097d0da5c6c4f1e49276cf0e835e1c5963177247e6f74fae4d1fbbb0e82eaa1e2ab9ad715ed0842661cc24ed3a5d59cc291b05ac4841b814ce799b3cbc366479', 'Zach', 'Mesinko', NULL),
(366, 'stu2024365', 'stu2024365@school.edu', 'scrypt:32768:8:1$jMD4SZrYWGUdvB1V$226f79e52092a0d56357e60fbb64c7731deef779277d6518f4f33ac30c8f217b9f0e4b2dcd31e183c613fa5832988756c36a2abf86044ba363bccc94a0302aed', 'Adam', 'Mesinko', NULL),
(367, 'stu2024366', 'stu2024366@school.edu', 'scrypt:32768:8:1$wluuJGUzkNGus6aU$f408cf3b45fddc3b61f212a98d8bf225e94ee10afa61f2de4b64dbee41093af529358e586edfaadf8485c973f027b36c4f615d1e8049e5fee32888515ca2a3bf', 'Danny', 'Chambers', NULL),
(368, 'stu2024367', 'stu2024367@school.edu', 'scrypt:32768:8:1$NzE1akUlmIA1fnXo$b3c7bf3b333a70403f5cb6ee0bfd760adfd050df049cdbf87389f0589cb2f8915d3ea520c14aaea1df0c9a3dfa66f96cccf785f3e0a18a3e25fed6e63c5e949d', 'Danny', 'Honeycutt', NULL),
(369, 'stu2024368', 'stu2024368@school.edu', 'scrypt:32768:8:1$CkdPScA5KlcY7bou$4d6a783e673ad4f562d788c193a348da3507d687235c7b2e78fb7db7f522f63b6916188785504a0bcbfe3da2747282ccdc55573b5604c87b350b60aba37a11e7', 'Danny', 'Winton', NULL),
(370, 'stu2024369', 'stu2024369@school.edu', 'scrypt:32768:8:1$3a1jhwIkxoFg1qKN$b3f392075df2ab07800969bcfc3cb2de0c02d3e0d1bd94bccc8612368f0d0cebedcc175a895320461ce693030abe8c0bf917a5a55c8fa39f760aa1829542265a', 'Lars', 'Eckburg', NULL),
(371, 'stu2024370', 'stu2024370@school.edu', 'scrypt:32768:8:1$G395kUgaw8kKdstU$8fd30514cf24e3e085342593ba224ee7944999599866c0a6592c662a62fe1c3f073a1b19e651379c9c119efc8a391026a5373aaffbe769eb2c90059271854264', 'Duke', 'Gains', NULL),
(372, 'stu2024371', 'stu2024371@school.edu', 'scrypt:32768:8:1$UuidYjsgdnRvlHXT$f6ee1fb3c7d66a93bcd14c2232a157d7e16a03f3239ae65f3a595b148acb4447e5269d9a313fc778dfcd1a23d312b45daf962b8284f87b7a77b48b866e8831bb', 'Jeff', 'Mohler', NULL),
(373, 'stu2024372', 'stu2024372@school.edu', 'scrypt:32768:8:1$Ls8hJnx3yVO0Xkle$259496a8d82a7b5d7bfe0cf8ebe8eeeb957cbc9c1bee3d3ff14ba469594ee3cafe59a8893b9a407ad47d67e702eaba8dcda46e9d4d033fa6c5c7faa6da84f1e8', 'Andrew', 'Mohler', NULL),
(374, 'stu2024373', 'stu2024373@school.edu', 'scrypt:32768:8:1$XIG2iBzfS5a32Ge1$2d494e3817bb921da3dd1dae84f988d819bd06f115ca0c5f33fb8553dac9cf28de351ee6c378aa33139495ab030b080b20b7eaa53904d6d82762381462f81d5a', 'Nathan', 'Mohler', NULL),
(375, 'stu2024374', 'stu2024374@school.edu', 'scrypt:32768:8:1$LeHYNvyyklfsFgTT$1622729fabab3370e760ab64aab7f8820dc4693e731481c1e357fc3d0c128bf775e0025b37b652856b8b76f6bf39a24976c6c6e39c75d9e84f834ef4ae053951', 'Jacob', 'Mohler', NULL),
(376, 'stu2024375', 'stu2024375@school.edu', 'scrypt:32768:8:1$waXbwS2ZiN4ElNU0$2a11b96d58e545e37556020eca0f7e741350a954ee2d2410f699b1ae9de00666abfd6303a940bf66c2d4cb641172659c7ad2fe8501982a1184b19552ea16a940', 'Martin', 'Mohler', NULL),
(377, 'stu2024376', 'stu2024376@school.edu', 'scrypt:32768:8:1$1TQWzDLWo9tgdWo3$90c506b2935efeb3c5cab76a1e0471d872e0725b0addbb29ac63a0ab10135e425a1b5897b7877e70c7af4d7441f21ad0c212d526fd5351e0d3cafb6b0b9fc287', 'Randall', 'Mohler', NULL),
(378, 'stu2024377', 'stu2024377@school.edu', 'scrypt:32768:8:1$T4loh4mJoZYRpEUA$176db7d5e508bc4d001fd263f91e59551b961492bdd71335431dc3ee23fc5a0d0d121d883e5407c87f38255cbebc6d07436326bc54dc0f5533b5434f9f54c1db', 'Jeremy', 'Reeder', NULL),
(379, 'stu2024378', 'stu2024378@school.edu', 'scrypt:32768:8:1$gHGwgIDnegDDAqpJ$92352127de2afd3a5b71ee89adac7233227d99633238871766b1c2af1dff79769d469b9d1e1d44ab3401e38d99699d4ec1737e5ae1b8ab4cb8c5d2665d27bdef', 'Ben', 'Hawley', NULL),
(380, 'stu2024379', 'stu2024379@school.edu', 'scrypt:32768:8:1$tL3nxc2xFJxAWqrA$62d980cf94e4a16f8f92b98e674e91855d873997395ba112dbfbd9c6bea431cd0a0f95799fe4fd7666aaa7c7492d47c45786516e05e41a3e7d785fc41e6807ee', 'Joshua', 'Robb', NULL),
(381, 'stu2024380', 'stu2024380@school.edu', 'scrypt:32768:8:1$3urAnkVyywZyM56q$1d5707f76f819017a23e919018a973d2a765bcdcdcb4cc6dbac9a0aca82fb8f9f7c2ce025517d62ec763dc20a7e4b98452db65c2a3c35050f1a660116eec76cb', 'JJ', 'Robb', NULL),
(382, 'stu2024381', 'stu2024381@school.edu', 'scrypt:32768:8:1$4Ck3iKjnHuho630P$a33fab2ff90c9d4884f5dce227d7b02f9eae9d546336b293ecb3d72940ec19f2ea3448c5749299a5289942307a7946bd7652bff19e404b932e6f31d59ccaec7b', 'Joey', 'Robb', NULL),
(383, 'stu2024382', 'stu2024382@school.edu', 'scrypt:32768:8:1$4sAknMDChgztWwkl$195f0ddfc1882456e94411e62ef619f816bb0a85e779b9a7441b13a53a2fcd66712a8073870769cc6946a15547306e6bf8a040cc7511642db8acdb429064b5b4', 'Ilia', 'Malinin', NULL),
(384, 'stu2024383', 'stu2024383@school.edu', 'scrypt:32768:8:1$6S1jwyLp97nJHksc$794aed7899e5aedbcd4dcf68e59168c1151072f3d60fbe082d3a605bcb2fc2dcd5acbf09c0772f833a75be1be33ea46cc1b1b0c6f9b6d1bdc3140ec271b2e470', 'Simon', 'Brown', NULL),
(385, 'stu2024384', 'stu2024384@school.edu', 'scrypt:32768:8:1$Lb0BrsU3htsLsHcl$e8c4b26721a38c30540d27912b4d88c3a0cbccc29206faad196c54fc58b569a899d133273fce4fd4533785bf3632c1ad6c31ae1421e1a10e8ac63eee0c28256a', 'Tyler', 'Kobel', NULL),
(386, 'stu2024385', 'stu2024385@school.edu', 'scrypt:32768:8:1$JJlvJlPxxsxGluml$52c67d07fc5b2abbe6eb701352dd4dbd2b51106af8070e6f9ebe215ce44bbc1b9d6970386f0db60dd55f3f65452dcba7c72bebe31e3dae0f54896c44643b52be', 'Mario', 'Roulette', NULL),
(387, 'stu2024386', 'stu2024386@school.edu', 'scrypt:32768:8:1$vfPGCgmrFVA3pI1J$cfb1792c6f3acacee123cb97cf6dfc322a88389190742cb5affcf93506aad41e17df02bf24fd3daaa091e8a52c8f311ac16b0827f644175d5a941c339f11e1da', 'Rick', 'Dancer', NULL),
(388, 'stu2024387', 'stu2024387@school.edu', 'scrypt:32768:8:1$fUlvqaDhKSVmWnzK$0b19218a87ff043d60734a84476616946b2b5852b41a25bf8b24e39e2cd746cec945bb7da3a73d9265d651c8fad8855bc345c6f4a3a4b8f5cc6a84a56b7bc9af', 'Gabriel', 'Silva', NULL),
(389, 'stu2024388', 'stu2024388@school.edu', 'scrypt:32768:8:1$ib1vq70oQetS9mYC$3ba62a55cca0589042bb173a74279a8fff544022e36221f1114e60ab664a3a768a73699e528dbe82d682e7f5c51db36dd1f3fafffa9c5793a896ef6b79863c70', 'Joshua', 'Kontour', NULL),
(390, 'stu2024389', 'stu2024389@school.edu', 'scrypt:32768:8:1$3nH9Rfc0LR5xSiar$568f693814529ba390010908d978ba7f9e9ea38c807fb0b1136fac6b4b69a2719dd69cd5c89d109f25fbe7cb91c5e17ab97beddc360905bf70a0ff75aaebdf30', 'Evan', 'Kontour', NULL),
(391, 'stu2024390', 'stu2024390@school.edu', 'scrypt:32768:8:1$N6bjHuVUgQIXPeMC$9482888abb8f51e932f2b7643ebf9dd699b90d5b2f88959c6165c2b4aa30fd3c810c7e435c1a1dc2341cb4c309221454e58be29321593163e4602654975c5e85', 'Joshua', 'Dundr', NULL),
(392, 'stu2024391', 'stu2024391@school.edu', 'scrypt:32768:8:1$OXgcIWjKeOkAnnwi$55f19673c127296584a45d6e190b2f053b0cf6848774abc37b148d12ca4e43de089dc668acfb3949ca0323bb50bf4ce4dd2f05c3ec518a8f0df5ca18bf5c8fe4', 'David', 'Merk', NULL),
(393, 'stu2024392', 'stu2024392@school.edu', 'scrypt:32768:8:1$0KLk9vdc4Xymrz7k$0e38a4638d72bf7689a2101781bd5318843f42a4960de88e0b35e4f52aafd74c0cf0437dbbb0a2b05d45248b2a07656179c5fa015c7cc21f3408696ecd108dc5', 'Charles', 'Ridley', NULL),
(394, 'stu2024393', 'stu2024393@school.edu', 'scrypt:32768:8:1$vkUwqpu9Gr2ogn3T$597ce9dabdc6c2e36604d1928ef2cbe3adfbc5e8d2f3b54b95f9df0da8b1b5608e24cf6e17e06db96718d4fbd806e27b44b72a18c10bd4acb9a9a6af18ae7c91', 'Johnathan', 'Ridley', NULL),
(395, 'stu2024394', 'stu2024394@school.edu', 'scrypt:32768:8:1$5NKc9DDCExQ3tTi5$4505f515ad862e75d17c6ee0de1e5d6063b5caf89821149e582fbc8088d4687009e2db3b10d929d2432c5884545536f0630ff75c696c6e957080fb0103bb9c76', 'Paul', 'Ridley', NULL),
(396, 'stu2024395', 'stu2024395@school.edu', 'scrypt:32768:8:1$jIg6imlmXwUWF359$a94091534cc9cda2ee5f217bbe0282c70417f9df19d1b58bcb6950776dada775adfcd93877d7c88184e04e9c9b0df94b05338b6dc7254f5f1aebdf6424882755', 'Michael', 'Slayton', NULL),
(397, 'stu2024396', 'stu2024396@school.edu', 'scrypt:32768:8:1$TYeTuL5tbeEBjmNH$7672945e723347b0c92fe69784b55fb2935c2720c70fd2ab3b4a28c8834a75ab376e87fab13700eec76f40dc95c47a59af38d643c248e8082395645d148e265f', 'Christian', 'Slayton', NULL),
(398, 'stu2024397', 'stu2024397@school.edu', 'scrypt:32768:8:1$3bJJAC6XwU100YnI$b4eb206a7bacc1625627373af716896f3070288fba4b4c68d48e3b1f886c0ec3afd05b310fc4e4899232d4bbb7e3fe024030bcc48dfbaf289eaabcf403d2c863', 'Levi', 'McCoaughey', NULL),
(399, 'stu2024398', 'stu2024398@school.edu', 'scrypt:32768:8:1$PxAidH7LuyGiXJ5H$3cae35e44179fa361edb3eba17023e8adf97dee11c842283afecf1fda5449d124eb6b32b0438f4ad62f8d4329523d609e2ebc7678dadf34e8143c547277d5eef', 'Livingston', 'McConaughey', NULL),
(400, 'stu2024399', 'stu2024399@school.edu', 'scrypt:32768:8:1$STeGRbxcBaPSWcrI$41be812890d8bd725b24ac24a74786f2688958e712bcf6bf4b9eb64b3451a6c17e029f781a818881ddf59aca62a70ce47e6b7a722403f5623de319d7821bc663', 'William', 'Vance', NULL),
(401, 'stu2024400', 'stu2024400@school.edu', 'scrypt:32768:8:1$VgD3Fd3PdQ06PJBV$b8e085b935d7f0de6f596a38dad049eb491672175e38cfdeb056e9a2d8a6159219a00c69b44aa82fc6aaca647d5eef8c879bf7b7212230c6f5bef0cf3216f21f', 'Andrew', 'Miller', NULL),
(402, 'stu2024401', 'stu2024401@school.edu', 'scrypt:32768:8:1$wNzfJvIkciOlvExD$81f3e83ebd370cef65b1be21f323df88fd804be9d122c5aec69f7d97ac1001ab463ecf990d690bfbcbf301b3742dc497165f456dead7df2bfe6c95fb3f3e02ef', 'Bradley', 'Little', NULL),
(403, 'stu2024402', 'stu2024402@school.edu', 'scrypt:32768:8:1$Z9bMuXF9aBR9DIxL$aa0be76841893505640b623c50eaa495d17e45901bf2e3641740ab2510377d3aebd707c36436a56db831e78ec702b57d9a70e119f4ab8ce8844de4dc236063cb', 'Curtis', 'Post', NULL),
(404, 'stu2024403', 'stu2024403@school.edu', 'scrypt:32768:8:1$13StfQr8PK00E0vv$02186ba5729b4ac4b236697d13f3558186e616015a8a24a59d7fad0eb17eaa9a421d90e3eafdf73df189a4a066ef3d74e0f9cc9b6cd36120c459b13009d637e2', 'Scout', 'Beachovich', NULL),
(405, 'stu2024404', 'stu2024404@school.edu', 'scrypt:32768:8:1$XjE259qtE4aI9tii$c3a338b4e34693c525091b1895bd49b34e816ae55c87fdc127daabfeb347eeb97de0df95da40e1db286e9f83ca84bc2ab3dd4ae5662862b077300a7c715d46fe', 'Deven', 'Jackson', NULL),
(406, 'stu2024405', 'stu2024405@school.edu', 'scrypt:32768:8:1$s4YlP1L97BdSCiE2$fdc83b5ad7d436468b8c00dc08e6ce43750ab337b4c9492d805b93815dd7b5340ca9f4e3bca77ccf2be34da5bb52edf9b3342c1720e99398af33241523da3baf', 'Casey', 'Likes', NULL),
(407, 'stu2024406', 'stu2024406@school.edu', 'scrypt:32768:8:1$99X1K0KdBPxiEaXP$2daf14ac2b0681b8193e9ef40e36d8adcfc0f9a5bdb8b3b3abd275f1eefa7a8fbbc88ac9861517acd014cb1954057f85b355d4b439ab4b23dc863c59871425c2', 'Eitan', 'Yahalomi', NULL),
(408, 'stu2024407', 'stu2024407@school.edu', 'scrypt:32768:8:1$5Vkz0P1lTMxM9tay$63ec8c92f3544650e590fbe0110344c890cb04bb183f837b62b32d4e03c1bd17bc34337668164ce0a2556b37011dcd4e3b8d8ca1bdfc5b3ee0ec37fd896b9dc0', 'Rizkallah', 'Saliba', NULL),
(409, 'stu2024408', 'stu2024408@school.edu', 'scrypt:32768:8:1$S9t8YrC0ZfmjlXIA$7cb9b4c47a58a6e54d9fba6d7f2413cc73fd8e80ce5a6a06702944134bc611534982f15be20124a8e18159905f8eddee2063e27a648f9f633f5aecad245653e6', 'Austin', 'Saliba', NULL),
(410, 'stu2024409', 'stu2024409@school.edu', 'scrypt:32768:8:1$AD47Tqt997TIY8vy$df1e7745564573f77889910fe39ba401751d706566b2c5bb4d0c2a0da21a7a96ddd86c81632b27e7369596ae6b27ea921238978ea106a596ccf76f74a2629b37', 'David', 'Saliba', NULL),
(411, 'stu2024410', 'stu2024410@school.edu', 'scrypt:32768:8:1$cycQjgyU4YHTlcBr$3bc4237d73031e45e8a3f6bdfff8b595ebc5d8c754c6a628d1dc0c58085ded0d83a7ddb1c48deeceeae493b18ef6dfd7b63dc300c6847ce0d9150271a49c323e', 'Neil', 'Rutter', NULL),
(412, 'stu2024411', 'stu2024411@school.edu', 'scrypt:32768:8:1$c7WUq4WQ68mD7g2N$a0b22884d2b4d6abbc0b84492b7e6b66bfe46f99264c526db87ed22984b46dff8b2e8fc94c69dcdd84a2a5c6ff6b4899f143a77b863d65b7e922e053005d8d8d', 'John', 'Skyview', NULL),
(413, 'stu2024412', 'stu2024412@school.edu', 'scrypt:32768:8:1$bG8kugmLXQtac8w3$f24db4c36c3467548eaa03611a22efa03c617824fb9140292b217e7a62f8bb138273828ebb763e3890cf522a7a83d29beae48c9c1c486173f053fea734b94744', 'Timothy', 'Bair', NULL),
(414, 'stu2024413', 'stu2024413@school.edu', 'scrypt:32768:8:1$QrWo3cprXjDxnamq$7a8bb10a13bca97c7945fc961e0c19c06e3adcd90dbadf6d454b64ecc4d5773ae4496a013bc00e02f5a236ea6322f20cd53acb487ceecdfd0b2c387ca921b3f2', 'David', 'Bair', NULL),
(415, 'stu2024414', 'stu2024414@school.edu', 'scrypt:32768:8:1$EHpwDFHn5z9BjniB$55bc7416ffd08b089ceb209153c527d9382a19cb6375931a166e1eba9d0f6ec4784513dfa55e40aeb4f732c5a75d7f499e548b6be804122c6e5027d2982cd89d', 'Michael', 'Weber', NULL),
(416, 'stu2024415', 'stu2024415@school.edu', 'scrypt:32768:8:1$g3tXMt6NhRE7UoCr$c7342420c83e94fa6287e7f8675dd7ab654d82e41ab3948b560b40927dc1949be72ad3bb0fe2965fe5fe725ccc2b788144f207fa09c3d105e1af65a0591f655c', 'Dean', 'Howard', NULL),
(417, 'stu2024416', 'stu2024416@school.edu', 'scrypt:32768:8:1$OF1g5yA7LWunwxIQ$6eeb9129089c4b3fdfe9b7f2122d6e3802b251479a530d3e9ae268f66794ced9feaace8ee1815b17958130bc10f580878ecd1d025010f765dfeda15ab5f7ab3a', 'Brandon', 'DelToro', NULL),
(418, 'stu2024417', 'stu2024417@school.edu', 'scrypt:32768:8:1$t7OaaMuJP6AeZfq5$137d0c52ab0a1ea9578b27e9047d4177c32125f15a1ddf0c03132b9255fe96584b93cff9b7ec430390e653c9184ab42e4ff8683ce91ffdb46c1e084755b0d9f6', 'Aaron', 'Favri', NULL),
(419, 'stu2024418', 'stu2024418@school.edu', 'scrypt:32768:8:1$00JFUjfIfzLxYmhX$43831615faee3516d3d0af4d19c2d03654c4a1d9626afcc6190e153b435dc679cb4da21da541fe37ff13be2c355bae0e6502485fb0698895b7f66f274636b3cc', 'Carson', 'Glasier', NULL),
(420, 'stu2024419', 'stu2024419@school.edu', 'scrypt:32768:8:1$lkDkSFiHJb8H3V5g$7a637b5a671c6fb53f1558bd41cc169169b66cf5cbbdce1b42c17ba76c0af3fddcd10fcea4aa7471307f9a02c54ec8760a9c6f0a30cf84f993308809cf43123e', 'Connor', 'Glasier', NULL),
(421, 'stu2024420', 'stu2024420@school.edu', 'scrypt:32768:8:1$SVw83cB6GUhd7iEQ$9d74145fadeefb45f672893d02cfd7c63c93c9b317c61c2131f92f61d0e927e07c404c031c7620255342d753bc1bdf83e7dbb14273664dd90d5c995348d2a6bd', 'Marty', 'Sampson', NULL),
(422, 'stu2024421', 'stu2024421@school.edu', 'scrypt:32768:8:1$GuJDJgpuMhZIAfjk$75d633377e1609cb359136464fe0dbb48c890b745ff6e5b49dea893d0e9a3b384cf103bf44d0339b701d3549a6b96c1d0bf8db813e793f868d7fc6d585b988a2', 'Mason', 'Sampson', NULL),
(423, 'stu2024423', 'stu2024423@school.edu', 'scrypt:32768:8:1$xd9aD2l4pnJZcVhE$11e18b857379dfeac43ba35379af3ff0cee449e61ede1e81db790a83512f0de2bc9196a741c9bbd4fb3d2049b6d2c75781ddf2fe341e8b27fe7af9cb9858c2c8', 'Hunter', 'Ebie', NULL),
(424, 'stu2024424', 'stu2024424@school.edu', NULL, 'Jonathan', 'Fielding', NULL);
INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `first_name`, `last_name`, `role_id`) VALUES
(425, 'stu2024425', 'stu2024425@school.edu', NULL, 'ig_abee', 'Australia', NULL),
(426, 'stu2024426', 'stu2024426@school.net', NULL, 'Cooper', 'Roberts', NULL),
(427, 'stu2024427', 'stu2024427@school.net', NULL, 'Luke', 'Roberts', NULL),
(428, 'stu20240429', 'stu20240429@schooldomain.com', 'scrypt:32768:8:1$3LDNTNc1V11VKBe4$e261da519e7b6bb4da7aa10b86422ca3fd4dcc31e1c72ed133734848b80471350b07c075c39f851691d6bbced791176f546b17b5547c200e67d87271997a238b', 'Ethan', 'McCaw', NULL),
(429, 'stu20240430', 'stu20240430@schooldomain.com', 'scrypt:32768:8:1$OxXI4CqCIe1X5NRw$c8aabfc6a7bea92e5ae739ebb58233c05efb02b1027ff44c5b8f7ead9c7a3062ebb8f39c8d5271b68416b37027ae7e1f4b46cca25b770f185d32b34d7c99558d', 'Brady', 'Procon', NULL),
(430, 'stu20240431', 'stu20240431@schooldomain.com', 'scrypt:32768:8:1$tPaaWk04sLhdkZ8L$306682a00cd8f4735820cb6311fabd633cea30f2332007cc1ac26f6c68b96c0fc56cf64fc2a1d67449a028047bc417b629de5d7247e4022dbeac70e939c82132', 'Jack', 'Holm', NULL),
(431, 'stu20240432', 'stu20240432@schooldomain.com', 'scrypt:32768:8:1$JwbUffUesub3sIwB$11b27fb6b7f066cd2004bdf9c7a88c227fc9a1624b672809a5811fda0b3e8a100907a72066315f0d0c2dbb4f0146e8f84dd59689738a15f77e6be0f20fcb1552', 'Benjamin', 'McCaw', NULL),
(432, 'stu20240433', 'stu20240433@schooldomain.com', 'scrypt:32768:8:1$y6eTw37llGAKVw5E$9662c55427aca9c60326b1b996fc4ba02242e0db5b7e6b5cdf1032ca77f5cf2c3c178df79d7acd9c203ee6bdc92c8fb650cd26c9a72ef0de42624d6667428681', 'Gia', 'Frenchboy-Normandy', NULL),
(433, 'stu20240434', 'stu20240434@school.net', NULL, 'Ryan', 'Chian', NULL),
(434, 'stu20240438', '20240438@school.edu', 'scrypt:32768:8:1$BNNKtymgwzO3wn4e$4bb49da79ee3006f3ca2ad1e9b0d636c00d62a8a7c7f18a611448c6710f9d72fa6f3b94cab02c353f7e8c74bcd180c9703a98325d26d642c9ff26053d5248486', 'Luke', 'Bowers', NULL),
(435, 'stu20240439', '20240439@school.edu', 'scrypt:32768:8:1$B1NV6V0HYrjXH261$54b4b9ba3e9efa172b786c69bcf6db0facdad9b880b9593c201bce737284ac83013f47882e715accbb1416c4682c8a17b670221680a04737e4ebc56bbaadc6d5', 'Riley', 'Burr', NULL),
(436, 'stu20240440', '20240440@school.edu', 'scrypt:32768:8:1$i4ImLx7WZLnLGze6$7ca259308ff7b67275d99ae0c394ced93d7ee99777229deb4e63edd4d8b81a9f73cd266228a973ad9e40dcf2e91d2ab038b5957c0ff80fd047204870c2a1b70c', 'Aiden', 'Burr', NULL),
(437, 'stu20240441', '20240441@school.edu', 'scrypt:32768:8:1$l6JmbxZ2qSOC3kUp$24f7f86868a3d0bfa3d0cdf7d8f10c982787db3c082e6cc567995147181d366a7df8e5ec1ab309131d958f3696b815f697cff04b3d838c985a62106c2b9cfe30', 'Isiah', 'Monville', NULL),
(438, 'stu20240442', 'stu20240442@school.edu', 'scrypt:32768:8:1$PQDHLG6DJHI5AVKr$bc5b2afbd261075e9baaef6d7dbff1241605bcde43f40a930a9742c2ac8bcc2105b5737b577aa0cbc20b2323453146292c3d3edfe64c2328f3c20d0dd50b77ce', 'Matthew', 'Szalsky', 19),
(440, 'stu20240443', 'stu20240443@school.edu', 'scrypt:32768:8:1$Z4PeSZGvwG3lK52Y$63abcd17a386c060e78dd0fb7484442888231df8282120a4d705240c3152e29728cadb247fc73bad7c1e2bd8ade72c1f82874844dce28a50ec8e53d2da7cc036', 'Deepak', 'Armanan', 19),
(441, 'stu20240444', 'stu20240444@school.edu', 'scrypt:32768:8:1$hk3MbDdOc01BDMxm$aab9ded82bc5bd5ddf54e642d42a7a24d37a0651e1ca0211d4c9cfe180c123a273c2c2d2e24d23ac61b8bbbc4fd54010c56435c2694c3e2de05aa4683f5946a0', 'Ishan', 'Armanan', 19),
(442, 'stu20240445', 'stu20240445@school.edu', 'scrypt:32768:8:1$y9RXKajVhSxKwJXw$4146e3b5cee06c652d37de37de7eab2dbe1c085d070d0a7eb5d1c4c9355d20aa6243dd9f9bed9b61bada35d18ae39a992a5bbf8a8940df1560d7631672c3a1ae', 'Douglass', 'Reynolds', 19),
(443, 'stu20240446', 'stu20240446@school.edu', 'scrypt:32768:8:1$1aTJQzCa6GkXF1OK$e9eaf50e3bd467c50350cd52966f7ceabe93a9f644f5adc05bab15f3031f9910e05c9e53e6d41eaa44f760d6d712e50f176c334e4fced2a77825644424d4276e', 'Samuel', 'Eldridge', 17),
(444, 'stu20240447', 'stu20240447@school.edu', 'scrypt:32768:8:1$eC5TqVLOaUmuUFQP$aee814ff6ec2b967ebbefced088b3437b02e3c1ae88de96fa79350a534dc99d0e699ad8184720ea1c03263a60a6c6fb32f87e058061769eedac74fa05ea3b71a', 'Blaine', 'Eldridge', 17),
(445, 'stu20240448', 'stu20240448@school.edu', 'scrypt:32768:8:1$r4TM9CFYciZ4QwCv$95e448765d644137840e7d9c1557bc8612ad177884aa96e66b151bfe8eadb38f407a1b946fe1103b92ce05a95440b449516001391b0d86e63b4e3b03d6ac2d63', 'Luke', 'Eldridge', 17);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_groups`
--
ALTER TABLE `role_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_group_memberships`
--
ALTER TABLE `role_group_memberships`
  ADD PRIMARY KEY (`role_id`,`group_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_user_email` (`email`),
  ADD UNIQUE KEY `ix_user_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `role_groups`
--
ALTER TABLE `role_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_group_memberships`
--
ALTER TABLE `role_group_memberships`
  ADD CONSTRAINT `role_group_memberships_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_group_memberships_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `role_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
