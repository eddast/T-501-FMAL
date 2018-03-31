(*****  Problem 1  *****)

(** i **)
fun segs3 [] = []
|   segs3 (a::[]) = []
|   segs3 (a::b::[]) = []
|   segs3 (a::b::c::d) = [a, b, c]::segs3(b::c::d);

(** ii **)
fun avgs3 lis = 
    (* Helper function listsum: gets sum of all elements in list in order to find list average *)
    let 
        fun listsum [] = 0.0
        |   listsum (a::b) = a+listsum(b)
    in
        map (fn x => listsum(x)/real(List.length(x))) (segs3(lis))
    end;


(*****  Problem 2  *****)

(** i **)
fun replicate (x,0) = []
|   replicate (x,y) = if y > 0 then x::replicate(x,y-1) else [];

(** ii **)
fun uncompress [] = []
|   uncompress lis = List.concat (map (fn x => replicate(x))(lis));

(** iii **)
fun maxSegsEq [] = []
|   maxSegsEq (x::xs) =  
        let
            val (samesSegment, rest) = List.partition(fn b => b = x )(x::xs)
        in
            samesSegment::maxSegsEq(rest)
        end;

(** iv **)
fun compress [] = []
|   compress (x) = map (fn i => (hd(i), List.length(i))) (maxSegsEq x)


(*****  Problem 3  *****)

(** i **)
fun follows oper [] = true
|   follows oper (x::[]) = true
|   follows oper (x::y::[]) = oper(x,y)
|   follows oper (x::y::xs) = if oper(x,y) then follows oper (y::xs) else false; 

(** ii **)
fun validCompr lis =
    (* Helper function getCompressedValues: gets first element in tupule pair and appends to a list *)
    (* That list is then evaluated via follows using the not equal <> op to validate compression  *)
    let
        fun getCompressedValues [] = []
        |   getCompressedValues ((one,two)::xs) = one::getCompressedValues(xs)
    in
        (* Checks whether first part of list tupule is not equal to ajacent elements *)
        (* Then checks whether second part of list tupule is non-zero and non-equal *)
        follows op<> (getCompressedValues lis) andalso List.all(fn b => let val (first,second) = b in second > 0 end)(lis)
    end;

(*****  Problem 4  *****)

(** i **)
fun evalPoly [] valx = 0.0
|   evalPoly (x::xs) valx = 
        (* Helper function evalPolinomal: evaluates polinomial with respect to variable x in the power of [i] *)
        let
            fun evalPolinomal [] valx = 0.0
            |   evalPolinomal (x::xs) valx = x*valx + evalPolinomal xs valx*valx
        in
            (* First element in list is a constant, therefore use helper function as encapsulation and only for remainder of list which uses variable x in power of i *)
            x + evalPolinomal xs valx
        end;

(** ii **)
fun addPoly [] [] = []
|   addPoly (lis:real list) [] = lis
|   addPoly [] (lis:real list) = lis
|   addPoly (x::xs:real list) (y::ys:real list) = (x+y)::addPoly xs ys;


(** iii **)
fun multPoly [] [] = []
|   multPoly (lisone:real list) [] = []
|   multPoly [] (lis:real list) = []
|   multPoly (lisone:real list) (listwo:real list) = 
        (* Helper function addZeroes; adds zeroes when appropriate to a multiplication result list *)
        (* Helper function applyAddition; adds all result lists via our addPoly function *)
        let
            fun addZeroes [] (idx:real list) = []
            |   addZeroes (x::xs:real list list) [] = x::addZeroes (xs) (0.0::[])
            |   addZeroes (x::xs:real list list) (idx:real list) = 
                let
                    val newList = idx@x
                in
                    newList::addZeroes (xs) (0.0::idx)
                end;
            fun applyAddition lis [] = lis
            |   applyAddition lis (x::xs) =  applyAddition (addPoly (lis)(x)) (xs);
        in
            (* Addition is applied to the result of multiplication of all elements of list1 to all elements of list2 with added zeroes*)
            (* This achieves long multiplication *)
            applyAddition [] (addZeroes (map (fn y => map(fn x => x*y)(lisone)) (listwo))[])
        end;