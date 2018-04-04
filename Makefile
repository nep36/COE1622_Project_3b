nep36_driver.class: nep36_driver.java nep36_lexer.java nep36_parser.java
		    javac nep36_driver.java

nep36_lexer.java: nep36_lexer.flex
	jflex nep36_lexer.flex

nep36_parser.java: nep36_parser.cup
	java -jar java-cup-11a.jar -interface -parser nep36_parser nep36_parser.cup