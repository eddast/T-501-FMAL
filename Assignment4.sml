(*****  Problem 1  *****)

(** i **)
fun segs3 [] = []
|   segs3 (a::[]) = []
|   segs3 (a::b::[]) = []
|   segs3 (a::b::c::d) = [a, b, c]::segs3(b::c::d);

(** ii **)
fun listsum[] = 0.0
|   listsum(a::b) = a+listsum(b);
fun avgs3 x = map (fn x => listsum(x)/3.0) (segs3(x));


(*****  Problem 2  *****)

(** i **)
fun replicate (x,0) = []
|   replicate (x,y) = if y > 0 then x::replicate(x,y-1) else [];

(** ii **)
fun uncompress [] = []
|   uncompress x = List.concat (map (fn x => replicate(x))(x));

(** iii **)
fun maxSegsEq [] = []
|   maxSegsEq (x::xs) =  
        let
            val (same, rest) = List.partition(fn b => b = x )(x::xs)
        in
            same::maxSegsEq(rest)
        end;

(** iv **)
fun compress [] = []
|   compress x = map ( fn (b::bs) => (b, List.length(b::bs)) ) (maxSegsEq x);


(*****  Problem 3  *****)

(** i **)
fun follows oper [] = true
|   follows oper (x::[]) = true
|   follows oper (x::y::[]) = oper(x,y)
|   follows oper (x::y::xs) = if oper(x,y) then follows oper (y::xs) else false; 

(** ii **)
fun getCompressedValues [] = []
|   getCompressedValues ((one,two)::xs) = one::getCompressedValues(xs);
fun validCompr lis = follows op<> (getCompressedValues lis) andalso List.all(fn b => let val (first,second) = b in second > 0 end)(lis);

(*****  Problem 4  *****)

(** i **)
fun evalPolinomal [] valx = 0.0
|   evalPolinomal (x::xs) valx = x*valx + evalPolinomal xs valx*valx;
fun evalPoly (x::xs) valx = x + evalPolinomal xs valx;

(** ii **)
fun addPoly [] [] = []
|   addPoly (lis:real list) [] = lis
|   addPoly [] (lis:real list) = lis
|   addPoly (x::xs:real list) (y::ys:real list) = (x+y)::addPoly xs ys;

(** iii **)

