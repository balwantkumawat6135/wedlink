-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 14, 2025 at 10:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wedlink`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`) VALUES
('admin@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `sn` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `sdes` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`sn`, `code`, `title`, `sdes`) VALUES
(3, 'I7ABCFE_3', '7 Signs Youâve Found the Right Life Partner', 'Choosing a life partner is one of the most important decisions youâll ever make. Hereâs how to know if theyâre the one.'),
(4, 'jnSBmEs_4', '10 Questions to Ask Before Saying Yes to a Marriage Proposal', 'Before accepting a marriage proposal, it\'s wise to have open conversations to avoid future surprises.'),
(5, 'QgDvFbx_5', 'Building Trust in an Arranged Marriage', ' Trust is the foundation of any strong marriage, especially in arranged setups. Here\'s how to build it from day one.'),
(6, '7rPVSGT_6', 'How to Make Your Matrimonial Profile Stand Out', 'Your profile is your first impression. Make it count with these tips.'),
(7, 'pTkcVfN_7', ' Red Flags to Watch for During the Talking Stage', 'Getting to know someone? Here are warning signs you shouldnât ignore.'),
(8, 'ewKp6vk_8', ' Why Compatibility Matters More Than Chemistry', 'Physical attraction fadesâcompatibility lasts. Hereâs why itâs crucial for a lasting relationship.'),
(9, 'EpuI1Rg_9', 'Post-Marriage Relationship Tips for Newlyweds', ' Marriage begins after the wedding. These habits will help strengthen your bond.'),
(10, 'iM67gqy_10', 'How to Involve Your Family in Matrimonial Decisions (Without Pressure)', 'Family involvement is important in many cultures. Hereâs how to balance tradition and personal choice.');

-- --------------------------------------------------------

--
-- Table structure for table `blog_points`
--

CREATE TABLE `blog_points` (
  `blog_code` varchar(50) NOT NULL,
  `point` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_points`
--

INSERT INTO `blog_points` (`blog_code`, `point`) VALUES
('I7ABCFE_3', 'You feel emotionally safe with them.\r'),
('I7ABCFE_3', 'You can be your true self without fear.\r'),
('I7ABCFE_3', 'You both share similar core values.\r'),
('I7ABCFE_3', 'Thereâs mutual respect and support.\r'),
('I7ABCFE_3', 'You trust each other deeply.\r'),
('I7ABCFE_3', 'Conflicts are resolved maturely.\r'),
('I7ABCFE_3', 'You envision a future together naturally.'),
('jnSBmEs_4', 'What are your long-term goals?\r'),
('jnSBmEs_4', 'How do you handle money?\r'),
('jnSBmEs_4', 'What are your expectations from married life?\r'),
('jnSBmEs_4', 'What role does religion or spirituality play in your life?\r'),
('jnSBmEs_4', 'How do you resolve conflicts?\r'),
('jnSBmEs_4', 'Are children part of your future plan?\r'),
('jnSBmEs_4', 'What are your views on careers and family balance?\r'),
('jnSBmEs_4', 'How do you express love and affection?\r'),
('jnSBmEs_4', 'Do you have any deal-breakers?\r'),
('jnSBmEs_4', 'How involved are you with your family?'),
('QgDvFbx_5', 'Communicate openly and regularly.\r'),
('QgDvFbx_5', 'Be consistent with your words and actions.\r'),
('QgDvFbx_5', 'Share your feelings without judgment.\r'),
('QgDvFbx_5', 'Respect each otherâs boundaries.\r'),
('QgDvFbx_5', 'Be patient and let trust develop naturally.'),
('7rPVSGT_6', 'Use a recent, high-quality photo.\r'),
('7rPVSGT_6', 'Write a sincere and positive bio.\r'),
('7rPVSGT_6', 'Highlight your hobbies and interests.\r'),
('7rPVSGT_6', 'Be honest about your expectations.\r'),
('7rPVSGT_6', 'Keep your language clear and respectful.\r'),
('7rPVSGT_6', 'Ask a friend or family member for feedback.'),
('pTkcVfN_7', 'Avoids answering serious questions.\r'),
('pTkcVfN_7', 'Shows controlling behavior early on.\r'),
('pTkcVfN_7', 'Talks negatively about all past relationships.\r'),
('pTkcVfN_7', 'Disrespects your boundaries or time.\r'),
('pTkcVfN_7', 'Lies or contradicts themselves often.'),
('ewKp6vk_8', 'Shared values help during tough times.\r'),
('ewKp6vk_8', 'Compatible couples communicate better.\r'),
('ewKp6vk_8', 'You can build habits and routines easily.\r'),
('ewKp6vk_8', 'It leads to a more balanced relationship.\r'),
('ewKp6vk_8', 'Itâs the key to long-term satisfaction.'),
('EpuI1Rg_9', 'Make time for quality conversations daily.\r'),
('EpuI1Rg_9', 'Celebrate small wins together.\r'),
('EpuI1Rg_9', 'Discuss finances transparently.\r'),
('EpuI1Rg_9', 'Respect each other\'s personal space.\r'),
('EpuI1Rg_9', 'Keep the romance alive through small gestures.'),
('iM67gqy_10', 'Clearly define what you want before discussions.\r'),
('iM67gqy_10', 'Respect their opinions, but donât let them dominate.\r'),
('iM67gqy_10', 'Involve them in meetings but take final decisions together.\r'),
('iM67gqy_10', 'Keep communication open between all parties.\r'),
('iM67gqy_10', 'Address concerns calmly and logically.');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `sn` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dob` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`sn`, `email`, `dob`) VALUES
(1, 'balwant@gmail.com', '2025-07-14 10:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `intrested`
--

CREATE TABLE `intrested` (
  `email` varchar(100) NOT NULL,
  `to_username` varchar(100) NOT NULL,
  `intrest` int(11) NOT NULL,
  `block_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `intrested`
--

INSERT INTO `intrested` (`email`, `to_username`, `intrest`, `block_by`) VALUES
('balwant@gmail.com', 'mohamed_k', 0, ''),
('jane@example.com', 'mohamed_k', 0, ''),
('jane@example.com', 'balwant_123', 0, ''),
('balwant@gmail.com', 'john_doe', 1, ''),
('john@example.com', 'mohamed_k', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `sn` int(11) NOT NULL,
  `to_username` varchar(100) NOT NULL,
  `from_username` varchar(100) NOT NULL,
  `msg` text NOT NULL,
  `msg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`sn`, `to_username`, `from_username`, `msg`, `msg_date`) VALUES
(1, 'balwant_123', 'john_doe', 'hii i am jhon\n', '2025-06-13'),
(2, 'balwant_123', 'john_doe', 'what are you doing', '2025-06-13'),
(3, 'john_doe', 'balwant_123', 'hii', '2025-07-11'),
(4, 'john_doe', 'balwant_123', 'what are you doing', '2025-07-11'),
(5, 'john_doe', 'balwant_123', 'how are you\n', '2025-07-12'),
(6, 'john_doe', 'balwant_123', 'hii', '2025-07-13'),
(7, 'john_doe', 'balwant_123', 'hello', '2025-07-13'),
(8, 'john_doe', 'balwant_123', 'hey buddy\n', '2025-07-13'),
(9, 'balwant_123', 'john_doe', 'hey what\'s up\n', '2025-07-13'),
(10, 'john_doe', 'balwant_123', 'Fine tell me about you\n', '2025-07-13'),
(11, 'balwant_123', 'john_doe', 'i also fine\n', '2025-07-13'),
(12, 'john_doe', 'balwant_123', 'what are you doing', '2025-07-13'),
(13, 'balwant_123', 'john_doe', 'nothig', '2025-07-13'),
(14, 'john_doe', 'balwant_123', 'tell me about you\n', '2025-07-13'),
(15, 'john_doe', 'balwant_123', 'hey ', '2025-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `success_stories`
--

CREATE TABLE `success_stories` (
  `sn` int(11) NOT NULL,
  `code` varchar(30) NOT NULL,
  `title` varchar(500) NOT NULL,
  `des` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `success_stories`
--

INSERT INTO `success_stories` (`sn`, `code`, `title`, `des`) VALUES
(1, '1021E98111119115_1', 'From Profiles to Promises: Priya & Arjunâs Perfect Match', 'We never imagined a swipe could change our lives forever. Priya, a graphic designer from Pune, and Arjun, a software engineer from Bengaluru, matched on Wedlink in December 2024. What began with a polite \"Hi\" quickly turned into long conversations about books, family values, and future dreams.\r\n\r\nAfter just three months of knowing each other, they met in person â and both families instantly approved. âWedlink helped us find someone who truly understands us,â Priya says. Arjun adds, âIt felt like we had known each other forever.â\r\n\r\nThey got engaged in April 2025 and tied the knot in a beautiful ceremony in June. Now, theyâre beginning a new chapter together, forever grateful to Wedlink for making it happen.'),
(2, 'I122F103VAT_2', 'Sakshi & Ramesh Success Story', 'We never imagined a swipe could change our lives forever. Priya, a graphic designer from Pune, and Arjun, a software engineer from Bengaluru, matched on Wedlink in December 2024. What began with a polite \"Hi\" quickly turned into long conversations about books, family values, and future dreams. After just three months of knowing each other, they met in person Ã¢ÂÂ and both families instantly approved. Ã¢ÂÂWedlink helped us find someone who truly understands us,Ã¢ÂÂ Priya says. Arjun adds, Ã¢ÂÂIt felt like we had known each other forever.Ã¢ÂÂ They got engaged in April 2025 and tied the knot in a beautiful ceremony in June. Now, theyÃ¢ÂÂre beginning a new chapter together, forever grateful to Wedlink for making it happen.'),
(3, '511198K99T109_3', 'Connected by Culture: Sneha & Rohit\'s Serendipitous Journey', 'Sneha, a classical dancer from Delhi, and Rohit, an architect from Jaipur, never thought a matrimonial platform would lead them to their soulmate. They connected on Wedlink in January 2025 after noticing their shared love for Indian traditions and festivals. Their conversations flowed effortlesslyâfrom favorite street foods to childhood memories. When they finally met in March, it felt like destiny had stepped in. âIt was more than just compatibility; it was comfort,â Sneha recalls. Their families bonded instantly, and within weeks, the wedding planning began. By May 2025, Sneha and Rohit were married, celebrating not just a union of hearts but also of families. They say, âWithout Wedlink, we might have never crossed paths.â'),
(4, '121105A119MO112_4', 'A Match Made in Messages: Kavya & Rishiâs Love Story', 'It started with a shared laugh over a meme on Wedlink in November 2024. Kavya, a data analyst from Hyderabad, and Rishi, a marketing strategist from Mumbai, quickly discovered their mutual sense of humor and passion for travel. What began as casual chats turned into daily calls, virtual coffee dates, and eventually a real connection. In February 2025, Rishi flew to Hyderabad to meet Kavya and her familyâboth sides felt the spark instantly. âHe felt like home,â says Kavya. By April, they were engaged, and their wedding in June was a perfect blend of tradition and modern joy. âWedlink helped us find not just a partner, but our best friend,â Rishi says with a smile.');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `username` varchar(30) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `gender` varchar(52) NOT NULL,
  `caste` varchar(50) NOT NULL,
  `religion` varchar(50) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`username`, `fname`, `lname`, `email`, `pass`, `gender`, `caste`, `religion`, `occupation`, `dob`, `city`, `state`, `country`) VALUES
('john_doe', 'John', 'Doe', 'john@example.com', 'password123', 'Male', 'Smith', 'Christian', 'Engineer', '1990-05-10', '', '', ''),
('jane_smith', 'Jane', 'Smith', 'jane@example.com', 'pass456', 'Female', 'Jones', 'Hindu', 'Teacher', '1988-07-15', '', '', ''),
('mohamed_k', 'Mohamed', 'Khan', 'mohamed@example.com', 'secure789', 'Male', 'Khan', 'Muslim', 'Doctor', '1985-12-01', '', '', ''),
('balwant_123', 'balwant ', 'kumawat', 'balwant@gmail.com', '1234', 'male', 'kumawat', 'Hindu', 'Teacher', '2000-03-15', 'bikaner', 'Rajasthan', 'India');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
