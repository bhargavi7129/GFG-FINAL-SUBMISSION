
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Table structure for table `patient`

CREATE TABLE `patient` (
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phone_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `patient`
  ADD PRIMARY KEY (`phone_no`);
COMMIT;

-- Table structure for table `signup`

CREATE TABLE `signup` (
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phoneno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `signup`
  ADD PRIMARY KEY (`phoneno`);
COMMIT;