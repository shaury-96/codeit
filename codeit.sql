-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2023 at 07:13 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeit`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `Sno` int(50) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `slug` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Sno`, `Title`, `content`, `datetime`, `slug`) VALUES
(1, 'first-p', '', '2023-05-25 22:03:49', 'post-1o'),
(2, 'Structure of Flask', 'The application will exist in a *package*. In Python, a sub-directory that includes a *__init__.py* file is considered a package, and can be imported. When you import a package, the *__init__.py* executes and defines what symbols the package exposes to the outside world.\n\n## Basic Flask application\n\nLet\'s create a package called `app`, that will host the application. Make sure you are in the *microblog* directory and then run the following command:\n\n```\n(venv) $ mkdir app\n```\n\n*app/__i', '2023-05-22 01:07:49', 'post-2'),
(3, 'Templates', 'Templates help achieve this separation between presentation and business logic. In Flask, templates are written as separate files, stored in a *templates*\r\n folder that is inside the application package.\r\n\r\nA couple of placeholders for the dynamic content, enclosed in `{{ ... }}`\r\n sections. These placeholders represent the parts of the page that are variable and will only be known at runtime.\r\n\r\nThe `render_template()` function invokes the [Jinja2](http://jinja.pocoo.org/) template engine that comes bundled with the Flask framework. Jinja2 substitutes `{{ ... }}`blocks with the corresponding values, given by the arguments provided in the `render_template()`call.\r\n\r\nYou have seen how Jinja2 replaces placeholders with actual values during rendering, but this is just one of many powerful operations Jinja2 supports in template files. For example, templates also support control statements, given inside `{% ... %}`\r\n\r\nJinja2 has a **template inheritance** feature that specifically addresses this problem. In essence, what you can do is move the parts of the page layout that are common to all templates to a base template, from which all other templates are derived.\r\n\r\n```\r\n{% extends \"base.html\" %}\r\n\r\n{% block content %}\r\n    <h1>Hi, {{ user.username }}!</h1>\r\n    {% for post in posts %}\r\n    <div><p>{{ post.author.username }} says: <b>{{ post.body }}</b></p></div>\r\n    {% endfor %}\r\n{% endblock %}\r\n```\r\n\r\n## Template Engine:\r\n\r\nTemplate engines take in tokenized strings and produce rendered strings with values in place of the tokens as output. Templates are typically used as an intermediate format written by developers to programmatically produce one or more desired output formats, commonly HTML, XML or PDF.\r\n\r\n### **Why are template engines important?**\r\n\r\nTemplate engines allow developers to generate desired content types, such as HTML, while using some of the data and programming constructs such as conditionals and for loops to manipulate the output. Template files that are created by developers and then processed by the template engine consist of prewritten markup and template tag blocks where data is inserted.', '2023-05-22 01:09:48', 'post-3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `Sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
