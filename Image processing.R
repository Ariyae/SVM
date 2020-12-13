#Image processing using Support Vector Machines technique

"When OCR software first processes a document, it divides the paper into a
matrix such that each cell in the grid contains a single glyph, which is just a term
referring to a letter, symbol, or number. Next, for each cell, the software will attempt
to match the glyph to a set of all characters it recognizes. Finally, the individual
characters would be combined back together into words, which optionally could be
spell-checked against a dictionary in the document's language.
In this exercise, we'll assume that we have already developed the algorithm to
partition the document into rectangular regions each consisting of a single character.
We will also assume the document contains only alphabetic characters in English.
Therefore, we'll simulate a process that involves matching glyphs to one of the 26
letters, A through Z.The attributes measure such characteristics as the horizontal and vertical
dimensions of the glyph, the proportion of black (versus white) pixels, and the
average horizontal and vertical position of the pixels. Presumably, differences in the
concentration of black pixels across various areas of the box should provide a way to
differentiate among the 26 letters of the alphabet"

letters<-read.csv(file.choose(),header = T)
str(letters)
View(letters)
letters_train <- letters[1:16000, ]
letters_test <- letters[16001:20000, ]
install.packages("kernlab")
library(kernlab)
letter_classifier <- ksvm(class ~ ., data = letters_train,
                            kernel = "rbfdot")
letter_predictions <- predict(letter_classifier, letters_test)
head(letter_predictions)
table(letter_predictions, letters_test$class)
agreement <- letter_predictions == letters_test$class
table(agreement)
prop.table(table(agreement))
