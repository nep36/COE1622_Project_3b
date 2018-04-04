/* Noah Perryman <nep36@pitt.edu>
 * CS 1622
 * Project 3a
*/

import java_cup.runtime.*;
import java.io.*;
import syntaxtree.*;
import visitor.*;
import java.util.*;

public class nep36_driver {
    public static void main(String argv[]) {
        
        if(argv.length != 1) {
            System.out.println("Error");
            System.exit(1);
        }
        
        Symbol parse_tree = null;
        
        try {

            Reader reader = new java.io.InputStreamReader(new java.io.FileInputStream(argv[0]));
            nep36_parser parser = new nep36_parser(new nep36_lexer(reader));
            parse_tree = parser.parse();
            
            Program program = ((Program) parse_tree.value);
            program.accept(new PrettyPrintVisitor());

        
        } catch (Exception e) {
            
            e.printStackTrace(System.err);
            
        }
        
    }
    
}
