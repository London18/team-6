CREATE TABLE IF NOT EXISTS `chatbot_db`.`chatbot` (
  `idchatbot` INT NOT NULL AUTO_INCREMENT,
  `intent` VARCHAR(45) NOT NULL,
  `answers` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idchatbot`))
ENGINE = InnoDB

INSERT INTO `chatbot` VALUES (1, 'rephrase', 'Could you please rephrase that?');
INSERT INTO `chatbot` VALUES (2, 'unknown', 'Unfortunately I am not able to answer that. Please see our site for FAQs: https://www.thebraintumourcharity.org/frequently-asked-questions/');
INSERT INTO `chatbot` VALUES (3, 'symptoms', 'Severe, persistent headaches. Persistent nausea, vomitting and drowsiness. Progressive weakness or paralysis on one side of the body.');
INSERT INTO `chatbot` VALUES (4, 'tumour_info_carer', 'It is important to remember that brain tumours are very rare. If your child is experiencing symptoms listed on our information pages or you have any concerns, you should speak to your doctor. Read our information on childhood brain tumour symptoms https://www.thebraintumourcharity.org/understanding-brain-tumours/symptoms-and-information/child-brain-tumour-symptoms');
INSERT INTO `chatbot` VALUES (5, 'tumour_info', 'It is important to remember that brain tumours are very rare, however if you have any concerns at all you should always speak to your doctor. Our page on adult brain tumour symptoms will inform you about the symptoms of a brain tumour: https://www.thebraintumourcharity.org/understanding-brain-tumours/symptoms-and-information/adult-brain-tumour-symptoms/.');
INSERT INTO `chatbot` VALUES (6, 'bye', 'Thank you for contacting the Brain Tumour Charity. Goodbye!');