Input:
fname_inp1=Copy_of_girl.jpg which is a face of a woman
fname_inp2=Copy_of_man.jpg which is the face of a man
tpts:- i have calculated the tie points from the image according to my convenience 
	for inp1 following are the tie points of 23X2 matrix
	SM=[519 223;534 387;487 300;535 294;535 555;516 717;489 640;540 640;721 375;765 468;720 561;846 327;931 466;847 606;838 468;1078 469;126 		472;946 228;1 1;1 990;1116 1;1116 990];
	corresponding points in mans face
	SN=[565 372;567 453;531 412;583 411;570 552;564 640;529 592;585 595;754 460;795 507;754 562;886 441;945 570;874 579;853 571;1080 519;234 		507;928 351;1 1;1 990;1116 1;1116 990];


output;
it generates a gif image name fname_out showing transition of face from a woman to man

Approach
I have delaunays triangulation.
since i used forward tracking , the images has some lines .


input given on command line
A2b_Ruchika_2018csb1117_2020_CS517("Copy_of_girl.jpg","Copy_of_man.jpg"," "," ",1)
