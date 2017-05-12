	(*
	 *****************************
	 ** Author: Farris Khalid   **
	 ** Date Written: 3/25/2017 **
	 ** Date Altered: 3/28/2017 **
	 *****************************
	 *****************************
	 **Description: This assignment will implement merge sort in Standard ML (SML) using SML New Jersey
	 **To Execute File: Right-Click, Open File with SML interpreter, double click the file
	 *****************************
	 *)
	
	
	(*
	* FUNCTION NAME: listOfLists
	* PURPOSE: takes from input list A into a list B that contains each individual element from list A wrapped as a its own list
	* PARAMETERS: n dimension list dubbed as list A 
	* RETURN: n+1 dimensional list B
	* ASSUMPTIONS: function recursively calls itself until reaching a base case and returns the list B
	*)
	fun listOfLists nil = nil 
	| listOfLists (f::e) = [f]::listOfLists(e);

	(*
	* FUNCTION NAME: merge
	* PURPOSE: takes in a single dimension list A and a single dimension list B as input and returns a sorted ascending single dimension list C which merged A and C 
	* PARAMETERS: a single dimension list A, a single dimension list B
	* RETURN: a single dimension list C
	* ASSUMPTIONS: both inputted list A and list B were previously sorted ascending, list C is sorted ascending, function recursively calls itself until reaching a base case	   
	*)
	fun merge(xs,nil) = xs
	| merge(nil,ys) = ys
	| merge(x::xs, y::ys) =
	if (x < y) then x::merge(xs, y::ys) else y::merge(x::xs,ys);
	
	(*
	* FUNCTION NAME: mergePass
	* PURPOSE: to merge pairs of sublists from list A
	* PARAMETERS: list A, a list of lists
	* RETURN: list B
	* ASSUMPTIONS: mergePass recursively calls itself until reaching a base case, input is a list of lists known as list A, number of sublists in list A may not necessarily be even
	*)
	fun mergePass [] = []
	| mergePass (x::nil) = [x]
	| mergePass (i::j::k) = if (length (i::j::k)) < 1 then mergePass(i::j::k) else [merge(i,j)]@mergePass(List.drop((i::j::k),2));
	
	(*
	* FUNCTION NAME: mergeSort
	* PURPOSE: repeatedly calls mergePass until there is only one sublist B
	* PARAMETERS: list A, a list of lists
	* RETURN: sublist B, a single dimensional list
	* ASSUMPTIONS: mergeSort recursively calls itself until reaching a base case, input is a list of lists known as list A
	*)
	fun mergeSort [] = []
	| mergeSort (x::nil) = x
	| mergeSort (x::y::z) = mergeSort((mergePass(x::y::nil))@(mergePass(z)));

	(*
	* FUNCTION NAME: mergeSortDriver
	* PURPOSE: calls mergeSort of listOfLists on inputted list A
	* PARAMETERS: list A
	* RETURN: list B, which a sorted ascending of inputted list A
	* ASSUMPTIONS: mergeSortDriver does not recursively call itself until reaching a base case, input is a list A
	*)
	fun mergeSortDriver [] = [] 
	| mergeSortDriver (x) = mergeSort (listOfLists(x)); 
	
	
	(*
	* FUNCTION NAME: intlistToString
	* PURPOSE: changes list A to a string
	* PARAMETERS: list A
	* RETURN: a string of all values in list A
	* ASSUMPTIONS: intlistToString recursively calls itself until reaching a base case before returning
	*)
	fun intlistToString [] =  ""
	| intlistToString (x::nil) = Int.toString x
	| intlistToString (x::xs) = Int.toString x ^ ", " ^ intlistToString (xs);
	
	(*
	* FUNCTION NAME: pairPrints
	* PURPOSE: to print the original list A and its sorted form
	* PARAMETERS: list A
	* RETURN: NONE
	* ASSUMPTIONS: does not recursively call itself, uses intlistToString to print list A and its sorted form to IO, uses mergeSortDriver to sort ascending
	*)
	fun pairPrints (x) = 
	let	
		val unsorted = intlistToString(x)
		val sortedVariation = mergeSortDriver(x)
		val sorted = intlistToString(sortedVariation)
	in 
		TextIO.print("\nUnsorted list generated: [ " ^ unsorted ^ " ] \n" ^ "Sorted variation of list: [ " ^ sorted ^ " ] \n \n")
	end;
		
	
	(*
	* FUNCTION NAME: getData
	* PURPOSE: designed to grab user data from IO to generate a random list of size n from specified range (lowBound, upperBound)
	* PARAMETERS: None
	* RETURN: a list containing [n,lowBound,upperBound] 
	*)
	fun getData () =
	let 
		fun getData2 (x) = x
		val askN = TextIO.print("Please input an integer value more than 50 to generate elements for the list: ")
		val n = valOf(Int.fromString(valOf(TextIO.inputLine TextIO.stdIn)))
		val askLow = TextIO.print("Input an integer value as lower bound for the range of possible random elements:")
		val lowBound = valOf(Int.fromString(valOf(TextIO.inputLine TextIO.stdIn)))
		val askUpper = TextIO.print("Input an integer value as upper bound for the range of possible random elements:")
		val upperBound = valOf(Int.fromString(valOf(TextIO.inputLine TextIO.stdIn)))
	in
		getData2(n::lowBound::upperBound::nil)
	end;
	
	(* This random variable must live outside function to properly execute in main *)
	val s = (Random.rand(1,5));
	
	(*
	* FUNCTION NAME: main
	* PURPOSE: calls helper functions to generate a random list and print to IO
	* PARAMETERS: NONE
	* RETURN: NONE 
	*)
	fun main () = 
	let 
		fun data (x::y::z) =
		if (x) = 0 then [] else (Random.randRange(y,hd z) s)::data((x-1)::y::z)
	in	
		pairPrints(data(getData()))
	end;
	
main();

(* this line below helps load this file into the top-level interactive system as though it had been typed or pasted into the SML interpreter *)
use "main.sml";

	
