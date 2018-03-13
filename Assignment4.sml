(*****  Problem 1  *****)

(** i **)
fun segs3 [] = []
|   segs3 (a::[]) = []
|   segs3 (a::b::[]) = []
|   segs3 (a::b::c::d) = [a, b, c]::segs3(b::c::d);

(** ii **)
fun listsum_[] = 0.0
|   listsum_(a::b) = a+listsum_(b);
fun avgs3_ [] = []
|   avgs3_ (a::d) = (listsum_(a))/3.0::avgs3_(d);
fun avgs3 (x) = avgs3_(segs3(x));


(*****  Problem 2  *****)

(** i **)

(** ii **)

(** iii **)

(** iv **)


(*****  Problem 3  *****)

(** i **)

(** ii **)


(*****  Problem 4  *****)

(** i **)

(** ii **)

(** iii **)

