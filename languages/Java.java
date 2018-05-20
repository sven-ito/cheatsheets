// Compiler Basics

// Classpath

	// Switch to show which class gets loaded from where:

// JAR

// JVM Basics

// Types

	// Generics

// Methods

	// Main Method - entry point for program

	public static void main(String[] args) {
		// ...
	}

// Conditions

// Loops

// Class Definition (myClass.java)

// Package - points to to file: org/apache/mycode/myClass.java
package org.apache.mycode;

public class myClass {
	
	private int myAttribute1;
	
	private String myAttribute2;
	
	// Constructors:
	
		public myClass() {
			// ...
		}

		public myClass(int myAttribute1, String myAttribute2) {
			// ...
		}
	
	// Getters:
	
		public int getMyAttribute1() {
			// ...
		}
		
		public String getMyAttribute2() {
			// ...
		}
	
	// Setters:
	
		public void setMyAttribute1(int value) {
			// ...
		}
		
		public void setMyAttribute2(String value) {
			// ...
		}
	
	
}

// Annotations

/* Lambda Expressions (Java 8)

	- functional interface -> object with only one method; 
		instead of handing over an (anonymous) object, hand over short expression
	
	- short way to write
		- infer type
		- body block ==> single expression
		- single identifier

*/

// Make functional interface explicit:
@FunctionalInterface
public interface MyFunctionalInterface {
	
	// Only one abstract method
	int foo(String s);
}

MyFunctionalInterface mfi = (String s) -> { return s.length(); };
MyFunctionalInterface mfi = (String s) -> s.length();
MyFunctionalInterface mfi = (s) -> s.length();
MyFunctionalInterface mfi = s -> s.length();