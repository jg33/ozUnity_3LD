{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 4,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 780.0, 171.0, 854.0, 853.0 ],
		"bglocked" : 1,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-260",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 2535.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/triggerEvent 18"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-261",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 2504.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 721.0, 777.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "GLITCH OUT"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-262",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 2502.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 775.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-257",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 2464.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/triggerEvent 17"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-258",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 2433.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 721.0, 748.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "GLITCH CAM"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-259",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 2431.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 746.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-256",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 779.0, 3020.0, 50.0, 22.0 ],
					"style" : "",
					"text" : "del 400"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-255",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 779.0, 3051.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "/vibrate 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-253",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 617.0, 3110.0, 56.0, 22.0 ],
					"style" : "",
					"text" : "s toOSC"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-252",
					"linecount" : 4,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 119.0, 1048.0, 51.0, 62.0 ],
					"style" : "",
					"text" : "/fireState 1 /vibrate 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-250",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 695.0, 3051.0, 69.0, 22.0 ],
					"style" : "",
					"text" : "/fireState 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-248",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 695.0, 3020.0, 57.0, 22.0 ],
					"style" : "",
					"text" : "del 1500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-247",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 646.0, 2985.0, 108.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 720.0, 717.0, 108.0, 20.0 ],
					"style" : "",
					"text" : "BURN THEM ALL"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-246",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 617.0, 3018.0, 69.0, 22.0 ],
					"style" : "",
					"text" : "/fireState 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-244",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 617.0, 2983.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 715.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-242",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 137.0, 488.0, 51.0, 22.0 ],
					"style" : "",
					"text" : "/cue 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-238",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 2389.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/triggerEvent 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-239",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 2358.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 721.0, 687.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "FireBall VIDEO"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-240",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 2356.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 685.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-235",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 2312.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay  \"toto\" 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-236",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 2281.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 721.0, 658.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "toto"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-237",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 2279.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 656.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-232",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 2238.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay  \"FireBall\" 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-233",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 2207.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 721.0, 632.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "FIRE BALL!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-234",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 2205.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 630.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-229",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 2160.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay  \"WitchPoof\" 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-230",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 2129.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 721.0, 554.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "Witch Poof!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-231",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 2127.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 552.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-226",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 2087.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay  \"Mland_Panic\" 1. 4."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-227",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 2056.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 784.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "MUNCHKINS PANIC!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-228",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 2054.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 782.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-223",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 2014.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/munchkinState 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-224",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 1983.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 730.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "PINK TURNOFF"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-225",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 1981.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 728.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-220",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 1946.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/munchkinState 6"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-221",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 1915.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 700.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "Glenda Fade 2 Pink"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-222",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 1913.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 698.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-217",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 1863.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/triggerEvent 12"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-218",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 1832.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 721.0, 606.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "OZFACE"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-219",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 1830.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 604.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-214",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 1779.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/loopAudioWithDelay  \"OhWeOh\" 0. 4. 4 4."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-215",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 1748.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 721.0, 580.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "OhWeOh"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-216",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 1746.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 578.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-211",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 1557.5, 165.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay  \"Mland_Locals\" 0. 9."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-212",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 1526.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 758.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "Mland_Locals"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-213",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 1524.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 756.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-208",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 333.0, 1779.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/triggerEvent 3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-209",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 363.0, 1748.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 578.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "STOP MOVIE"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-210",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 333.0, 1746.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 576.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-205",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 1706.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/triggerEvent 6"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-206",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 1675.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 642.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "COPYRIGHT"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-207",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 1673.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 640.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-202",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 333.0, 1630.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-203",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 363.0, 1599.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 550.5, 144.0, 20.0 ],
					"style" : "",
					"text" : "STOP AUDIO"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-204",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 333.0, 1597.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 548.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-201",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 622.0, 1179.0, 145.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 277.0, 903.5, 156.0, 20.0 ],
					"style" : "",
					"text" : "RANDOM SOUNDS:::::::::"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-200",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 767.0, 1192.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 524.5, 156.0, 20.0 ],
					"style" : "",
					"text" : "3LD_Ambient"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-197",
					"linecount" : 4,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.0, 1628.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay  \"MargetHamiltonSizzle\" 0. 3."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-198",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 801.0, 1597.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 813.0, 144.0, 20.0 ],
					"style" : "",
					"text" : "Margret Hamilton Sizzle"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-199",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 771.0, 1595.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 811.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-194",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 767.0, 1483.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay  \"PlayMoney\" 1. 15."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-195",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 797.0, 1450.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 670.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Play Money"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-196",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 767.0, 1448.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 670.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-191",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 767.0, 1405.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay  \"TwisterEvent\" 1. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-192",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 797.0, 1374.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 615.5, 100.0, 20.0 ],
					"style" : "",
					"text" : "Twister Event"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-193",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 767.0, 1372.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 613.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 767.0, 1333.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay  \"Barnyard\" 1. 8."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-168",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 797.0, 1302.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 585.5, 100.0, 20.0 ],
					"style" : "",
					"text" : "Barnyard"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-169",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 767.0, 1300.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 583.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-116",
					"linecount" : 4,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 767.0, 1252.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudioWithDelay \"YouWereThereAmbient\" 1. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-117",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 797.0, 1221.0, 145.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 511.0, 552.5, 156.0, 20.0 ],
					"style" : "",
					"text" : "You Were There Ambient"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-118",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 767.0, 1219.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.0, 550.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-188",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2896.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"munchkinLaugh\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-189",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2863.0, 108.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 725.0, 1052.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "munchkin laugh"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-190",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2863.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 695.0, 1050.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-185",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2818.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/triggerEvent 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-186",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2785.0, 124.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 658.5, 120.0, 20.0 ],
					"style" : "",
					"text" : "TRIGGER EVENT 0\n"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-187",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2785.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 656.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-182",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2740.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"laughShort\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-183",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2707.0, 108.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 725.0, 994.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "laugh short"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-184",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2707.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 695.0, 992.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-179",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2665.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"ladiescheering3\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-180",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2632.0, 108.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 725.0, 966.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "ladies cheering 3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-181",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2632.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 695.0, 964.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-176",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2590.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"ladiescheering2\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-177",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2557.0, 108.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 725.0, 938.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "ladies cheering 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-178",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2557.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 695.0, 936.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-173",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2517.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"ladiescheering\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-174",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2484.0, 108.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 588.0, 1070.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "ladies cheering"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-175",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2484.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 558.0, 1068.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-170",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2441.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"dudescheering3\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-171",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2410.0, 108.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 588.0, 1044.0, 107.0, 20.0 ],
					"style" : "",
					"text" : "dudes cheering 3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-172",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2408.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 558.0, 1042.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-165",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2368.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"dudescheering2\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-166",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2337.0, 108.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 588.0, 1019.0, 107.0, 20.0 ],
					"style" : "",
					"text" : "dudes cheering 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-167",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2335.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 558.0, 1016.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-162",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2294.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"dudescheering\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-163",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2263.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 588.0, 990.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "dudes cheering"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-164",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2261.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 558.0, 987.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-159",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2216.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"applauses\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-160",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2185.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 588.0, 964.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Applauses"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-161",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2183.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 558.0, 961.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-156",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2145.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"applauses9\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-157",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2114.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 588.0, 937.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Applause9"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-158",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2112.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 558.0, 934.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-153",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2074.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"applauses2\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-154",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 2043.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 448.0, 1068.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Applause2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-155",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 2041.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 418.0, 1067.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-150",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 2001.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"applause1\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-151",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1970.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 448.0, 1040.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Applause1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-152",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1968.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 418.0, 1040.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-147",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1926.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"wind4\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-148",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1895.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 448.0, 1014.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Wind4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-149",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1893.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 418.0, 1012.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-144",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1853.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"wind3\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-145",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1822.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 448.0, 986.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Wind3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-146",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1820.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 418.0, 984.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-141",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1779.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"wind2\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-142",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1748.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 448.0, 960.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Wind2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-143",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1746.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 418.0, 958.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-138",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1704.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"wind\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-139",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1673.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 448.0, 934.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Wind"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-140",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1671.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 418.0, 932.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-135",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1632.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"drums2\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-136",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1601.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 1067.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Drums2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-137",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1599.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 1067.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-132",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1557.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"drums1\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-133",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1526.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 311.0, 1041.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Drums1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-134",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1524.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 1041.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1483.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"frogs2\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-130",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1452.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 1014.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Frogs2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-131",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1450.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 1012.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-126",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1403.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"frogs1\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-127",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1372.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 988.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Frogs1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-128",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1370.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 986.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-123",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1331.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/vibrate 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-124",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1300.0, 100.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 624.0, 123.0, 20.0 ],
					"style" : "",
					"text" : "VIBRATE PHONE!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-125",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1298.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 622.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-119",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 622.0, 1252.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"noPlace\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-120",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.0, 1221.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 934.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "NoPlace"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-121",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 622.0, 1219.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 932.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-113",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 7.5, 963.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/triggerEvent 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-114",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 37.5, 932.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 326.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Applause Clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-115",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 7.5, 930.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 324.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-110",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 7.5, 881.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/playAudio \"applauses\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 37.5, 850.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 293.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Applause"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 7.5, 848.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 291.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 1234.5, 196.0, 27.5 ],
					"style" : "",
					"text" : "/sendText \"Stay tuned!\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 356.0, 1202.0, 161.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 363.5, 151.0, 20.0 ],
					"style" : "",
					"text" : "Stay Tuned!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 326.0, 1202.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 361.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-104",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 1158.5, 196.0, 27.5 ],
					"style" : "",
					"text" : "/sendText \"Thanks for coming! Extras have been unlocked... now loading Munchkinland... "
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 356.0, 1126.0, 161.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 333.5, 122.0, 20.0 ],
					"style" : "",
					"text" : "THANK YOU!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 326.0, 1126.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 331.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-101",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 1086.5, 196.0, 27.5 ],
					"style" : "",
					"text" : "/sendText \"@OhMyWIZ@RD: Another day another fire!\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 356.0, 1054.0, 161.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 305.5, 122.0, 20.0 ],
					"style" : "",
					"text" : "Abby: Fire Tweet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-103",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 326.0, 1054.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 303.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-98",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 1012.5, 196.0, 27.5 ],
					"style" : "",
					"text" : "/sendText \"@OhMyWIZ@RD: Ray Bolger becomes scarecrow. #NoOilCanForYou\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-99",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 356.0, 980.0, 161.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 277.5, 151.0, 20.0 ],
					"style" : "",
					"text" : "Abby: TinMan Ray Tweet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-100",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 326.0, 980.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 275.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-95",
					"linecount" : 4,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 941.5, 196.0, 27.5 ],
					"style" : "",
					"text" : "/sendText \"@OhMyWIZ@RD: Can't believe the amount of hospital visits...Oz can be dangerous sometimes.\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-96",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 356.0, 909.0, 140.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 251.5, 122.0, 20.0 ],
					"style" : "",
					"text" : "Abby: Hospital Tweet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-97",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 326.0, 909.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 249.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 871.5, 196.0, 27.5 ],
					"style" : "",
					"text" : "/sendText \"@OhMyWIZ@RD: I can always rely on Emma to get me where I need to go!\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-92",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 356.0, 839.0, 140.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 223.5, 122.0, 20.0 ],
					"style" : "",
					"text" : "Abby: Emma Tweet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 326.0, 839.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 221.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 802.5, 196.0, 27.5 ],
					"style" : "",
					"text" : "/sendText \"@OhMyWIZ@RD: OMG, This play back!!!\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 356.0, 770.0, 140.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 194.5, 142.0, 20.0 ],
					"style" : "",
					"text" : "Abby: Playback Tweet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 326.0, 770.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 192.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 732.5, 196.0, 27.5 ],
					"style" : "",
					"text" : "/sendText \"@OhMyWIZ@RD: Toto really shines on camera. #KansasTruth\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 356.0, 700.0, 140.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 164.5, 122.0, 20.0 ],
					"style" : "",
					"text" : "Abby: Toto Tweet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-71",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 326.0, 700.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 162.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 655.0, 200.0, 28.0 ],
					"style" : "",
					"text" : "/sendText \"@OhMyWIZ@RD: Abby here! This bed is too tall! #KansasStruggles\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 356.0, 623.0, 140.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 133.5, 122.0, 20.0 ],
					"style" : "",
					"text" : "Abby: Bed Tall"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 326.0, 623.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 131.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-93",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 446.0, 337.0, 67.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 103.0, 67.0, 20.0 ],
					"style" : "",
					"text" : "Clear Text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-91",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 414.0, 337.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 101.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"keymode" : 1,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 414.0, 366.0, 59.0, 18.0 ],
					"style" : "",
					"tabmode" : 0,
					"text" : "\" \""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-89",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 7.5, 732.5, 120.0, 23.5 ],
					"style" : "",
					"text" : "/sendWikiText \" \" \" \"\n"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"linecount" : 24,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 7.5, 802.5, 108.0, 30.0 ],
					"style" : "",
					"text" : "/sendWikiText \"Alan Greenspan\" \"<i>Alan Greenspan and Ayn Rand<\\/i> \\\nAlan Greenspan, the longest-serving Chairman of the Federal Reserve (1987-2006), was an active member of The Ayn Rand Collective. His article in support of an unmodified gold standard, \\\"Gold and Economic Freedom,\\\" was published in her periodical <i>The Objectivist</i> in 1966.\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-83",
					"linecount" : 22,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 7.5, 655.0, 114.0, 28.0 ],
					"style" : "",
					"text" : "/sendWikiText \"Rand Paul\" \"<i>Rand Paul and Ayn Rand</i>  \nNo evidence has surfaced that Senator and presidential hopeful Rand Paul was named or re-named after Ayn Rand despite persistent claims to the contrary. Senator Paul and his wife are admitted fans of Ayn Rand's philosophy and novels, as is his father, former Congressman Ron Paul of Texas.\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 37.5, 700.0, 90.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 459.0, 94.0, 20.0 ],
					"style" : "",
					"text" : "[nothing, clear]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 7.5, 698.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 457.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 37.5, 771.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 495.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "Alan Greenspan"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 37.5, 623.0, 73.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 509.0, 427.0, 94.0, 20.0 ],
					"style" : "",
					"text" : "Rand Paul"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 7.5, 623.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 424.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 7.5, 769.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 479.0, 493.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 19.0, 960.0, 150.0, 20.0 ],
					"style" : "",
					"text" : "Last command"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 586.5, 997.0, 95.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll randomText"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-86",
					"linecount" : 13,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 7.5, 1227.0, 183.0, 183.0 ],
					"style" : "",
					"text" : "/sendRandomText \"/sendWikiText Alan Greenspan <i>Alan Greenspan and Ayn Rand</i> Alan Greenspan, the longest-serving Chairman of the Federal Reserve (1987-2006), was an active member of The Ayn Rand Collective. His article in support of an unmodified gold standard, Gold and Economic Freedom, was published in her periodical The Objectivist in 1966.\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 377.5, 426.0, 242.0, 47.0 ],
					"style" : "",
					"text" : "The first time you try to send text there is a long delay - about 10 sec.\n.or is the UDP send slow?"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 455.0, 212.0, 30.0, 22.0 ],
					"style" : "",
					"text" : "t b l",
					"textcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 670.5, 205.5, 29.5, 35.0 ],
					"style" : "",
					"text" : "goto 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 421.0, 147.0, 69.0, 22.0 ],
					"style" : "",
					"text" : "delay 4000",
					"textcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.428614, 1.0, 0.509132, 1.0 ],
					"fontface" : 1,
					"id" : "obj-72",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 324.5, 15.5, 640.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 422.0, 6.5, 366.0, 20.0 ],
					"style" : "",
					"text" : "MANUAL Jump to cue - with RESET & 4 Sec DELAY for fade!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 383.25, 147.0, 29.5, 22.0 ],
					"style" : "",
					"text" : "0",
					"textcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "", "bang" ],
					"patching_rect" : [ 446.0, 112.5, 105.0, 22.0 ],
					"style" : "",
					"text" : "t b l b",
					"textcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 446.0, 83.5, 51.0, 22.0 ],
					"style" : "",
					"text" : "goto $1",
					"textcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 455.0, 180.5, 50.0, 22.0 ],
					"style" : "",
					"text" : "goto 10",
					"textcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.439216, 0.74902, 0.254902, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"id" : "obj-26",
					"items" : [ 1, ",", 2, ",", 3, ",", 4, ",", 5, ",", 6, ",", 7, ",", 8, ",", 9, ",", 10, ",", 11, ",", 12, ",", 13, ",", 14, ",", 15, ",", 16, ",", 17, ",", 18, ",", 19, ",", 20, ",", 21, ",", 22, ",", 23, ",", 24, ",", 25, ",", 26, ",", 27, ",", 28, ",", 29, ",", 30, ",", 31, ",", 32, ",", 33, ",", 34, ",", 35, ",", 36, ",", 37, ",", 38, ",", 39, ",", 40, ",", 41, ",", 42, ",", 43, ",", 44, ",", 45, ",", 46, ",", 47, ",", 48, ",", 49, ",", 50, ",", 51, ",", 52, ",", 53, ",", 54, ",", 55, ",", 56, ",", 57, ",", 58 ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 313.0, 60.5, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 422.0, 31.0, 100.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 405.5, 218.5, 33.0, 22.0 ],
					"style" : "",
					"text" : "next",
					"textcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 101.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 191.0, 59.0, 75.0, 20.0 ],
					"style" : "",
					"text" : "current cue"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 104.0, 289.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 135.0, 59.0, 50.0, 22.0 ],
					"style" : "",
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 174.5, 389.0, 73.0, 22.0 ],
					"style" : "",
					"text" : "fromsymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 178.0, 289.0, 59.0, 22.0 ],
					"style" : "",
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 174.5, 321.0, 100.0, 22.0 ],
					"style" : "",
					"text" : "prepend process"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 174.5, 351.0, 78.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "oscProc.js",
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "js oscProc.js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 774.5, 829.0, 59.0, 22.0 ],
					"style" : "",
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 830.75, 636.0, 59.0, 22.0 ],
					"style" : "",
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 873.25, 761.0, 29.5, 22.0 ],
					"style" : "",
					"text" : "join"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"linecount" : 7,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 546.75, 1048.0, 255.0, 102.0 ],
					"style" : "",
					"text" : "\"<i>Alan Greenspan</i> Alan Greenspan, the longest-serving Chairman of the Federal Reserve (1987-2006) was an active member of The Ayn Rand Collective. His article in support of an unmodified gold standard Gold and Economic Freedom, was published in her periodical The Objectivist in 1966.0000\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 751.75, 780.0, 54.0, 22.0 ],
					"style" : "",
					"text" : "pack l l l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 760.75, 600.0, 61.0, 22.0 ],
					"style" : "",
					"text" : "route text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 736.75, 689.0, 29.5, 22.0 ],
					"style" : "",
					"text" : "13"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 736.75, 717.0, 40.0, 22.0 ],
					"style" : "",
					"text" : "itoa"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 567.75, 689.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 546.75, 891.0, 115.0, 22.0 ],
					"style" : "",
					"text" : "/sendWikiText s s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 654.75, 636.0, 59.0, 22.0 ],
					"style" : "",
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 654.75, 600.0, 61.0, 22.0 ],
					"style" : "",
					"text" : "route text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 830.75, 600.0, 61.0, 22.0 ],
					"style" : "",
					"text" : "route text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 614.75, 829.0, 132.0, 22.0 ],
					"style" : "",
					"text" : "pack /sendWikiText s s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 525.5, 279.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 211.0, 86.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 155.0, 677.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 402.0, 150.0, 20.0 ],
					"style" : "",
					"text" : "Raw Commands"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 295.0, 457.0, 59.0, 22.0 ],
					"style" : "",
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 295.0, 488.0, 109.0, 22.0 ],
					"style" : "",
					"text" : "prepend /sendText"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 295.0, 339.0, 96.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 79.0, 96.0, 20.0 ],
					"style" : "",
					"text" : "Text Sender"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 295.0, 426.0, 61.0, 22.0 ],
					"style" : "",
					"text" : "route text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"keymode" : 1,
					"linecount" : 3,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 295.0, 366.0, 100.0, 50.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 280.0, 101.0, 189.0, 168.0 ],
					"style" : "",
					"tabmode" : 0,
					"text" : "\"Take a selfie! Love, The Builders \""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 7.5, 428.0, 72.0, 22.0 ],
					"style" : "",
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 7.5, 558.0, 47.0, 22.0 ],
					"style" : "",
					"text" : "/ping 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 7.5, 477.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 7.5, 521.0, 78.0, 22.0 ],
					"style" : "",
					"text" : "metro 10000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 62.0, 349.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 271.0, 13.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "ACTIVE",
					"textcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ],
					"texton" : "PASSIVE",
					"textoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 155.0, 817.0, 61.0, 22.0 ],
					"style" : "",
					"text" : "route text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"keymode" : 1,
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 155.0, 706.0, 100.0, 35.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 280.0, 424.0, 193.0, 93.0 ],
					"style" : "",
					"tabmode" : 0,
					"text" : "/munchkinState 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 62.0, 389.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "/forcePassive $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 51.0, 147.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 61.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "PREV",
					"texton" : "PREV"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 112.0, 210.0, 34.0, 22.0 ],
					"style" : "",
					"text" : "prev"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-55",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 670.5, 316.0, 29.5, 22.0 ],
					"style" : "",
					"text" : "10"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 705.0, 309.0, 40.0, 22.0 ],
					"style" : "",
					"text" : "itoa"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 698.0, 351.0, 71.0, 22.0 ],
					"style" : "",
					"text" : "prepend $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 584.0, 316.0, 92.0, 22.0 ],
					"style" : "",
					"text" : "t l b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 551.0, 314.0, 29.5, 22.0 ],
					"style" : "",
					"text" : "set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 584.0, 351.0, 102.0, 22.0 ],
					"style" : "",
					"text" : "prepend prepend"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"linecount" : 7,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 950.0, 389.0, 773.0, 100.0 ],
					"presentation" : 1,
					"presentation_linecount" : 7,
					"presentation_rect" : [ 23.0, 108.0, 252.0, 100.0 ],
					"style" : "",
					"text" : "/cue1\n/triggerEvent0\n/monkeyState0\n/poppyState0\n/munchkinState0\n/tornadoState0\n/cue0\n"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 757.0, 66.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 86.0, 150.0, 20.0 ],
					"style" : "",
					"text" : "Message Log:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 757.0, 39.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 19.0, 13.0, 150.0, 20.0 ],
					"style" : "",
					"text" : "Oz Osc Control"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 51.0, 175.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 37.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "NEXT",
					"texton" : "NEXT"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 261.0, 175.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 135.0, 37.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "RESET",
					"texton" : "RESET"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 201.5, 632.0, 56.0, 22.0 ],
					"style" : "",
					"text" : "s toOSC"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 241.5, 210.0, 44.0, 22.0 ],
					"style" : "",
					"text" : "goto 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 178.0, 210.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "next"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 178.0, 256.0, 129.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll cues_shanghai.txt"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 21.0, 9.0, 54.0, 22.0 ],
					"style" : "",
					"text" : "r toOSC"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 66.0, 140.0, 22.0 ],
					"style" : "",
					"text" : "udpsend 127.0.0.1 8050"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 178.0, 175.0, 65.0, 22.0 ],
					"style" : "",
					"text" : "sel 32 114"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 4,
					"outlettype" : [ "int", "int", "int", "int" ],
					"patching_rect" : [ 178.0, 135.0, 50.5, 22.0 ],
					"style" : "",
					"text" : "key"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 335.5, 1116.0, 304.0, 1116.0, 304.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 335.5, 1188.0, 305.0, 1188.0, 305.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-104", 0 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 335.5, 1263.0, 305.0, 1263.0, 305.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 17.0, 921.0, 150.0, 921.0, 150.0, 813.0, 164.5, 813.0 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 17.0, 996.0, 15.0, 996.0, 15.0, 1007.0, 151.0, 1007.0, 151.0, 813.0, 164.5, 813.0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 776.5, 1284.0, 228.0, 1284.0, 228.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1284.0, 236.0, 1284.0, 236.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 17.0, 590.0, 211.0, 590.0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 776.5, 1365.0, 228.0, 1365.0, 228.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1362.0, 236.0, 1362.0, 236.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-123", 0 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1434.0, 236.0, 1434.0, 236.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1515.0, 236.0, 1515.0, 236.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1590.0, 237.0, 1590.0, 237.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1665.0, 235.0, 1665.0, 235.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 0 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1737.0, 235.0, 1737.0, 235.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-138", 0 ],
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1812.0, 237.0, 1812.0, 237.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1884.0, 235.0, 1884.0, 235.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-144", 0 ],
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 1957.0, 234.0, 1957.0, 234.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-147", 0 ],
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2041.5, 235.0, 2041.5, 235.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-150", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-150", 0 ],
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2114.5, 234.0, 2114.5, 234.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-153", 0 ],
					"source" : [ "obj-155", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2185.5, 236.0, 2185.5, 236.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-156", 0 ],
					"source" : [ "obj-158", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2256.5, 235.0, 2256.5, 235.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2334.5, 235.0, 2334.5, 235.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-162", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2408.5, 236.0, 2408.5, 236.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-165", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-165", 0 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"source" : [ "obj-169", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2481.5, 234.0, 2481.5, 234.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-170", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2557.5, 234.0, 2557.5, 234.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-173", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-173", 0 ],
					"source" : [ "obj-175", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2630.5, 234.0, 2630.5, 234.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-176", 0 ],
					"source" : [ "obj-178", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2705.5, 237.0, 2705.5, 237.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-179", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-179", 0 ],
					"source" : [ "obj-181", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2780.5, 235.0, 2780.5, 235.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-182", 0 ],
					"source" : [ "obj-184", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2858.5, 234.0, 2858.5, 234.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-185", 0 ],
					"source" : [ "obj-187", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 631.5, 2936.5, 236.0, 2936.5, 236.0, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-188", 0 ],
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 776.5, 1437.0, 228.0, 1437.0, 228.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-191", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 0 ],
					"source" : [ "obj-193", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 776.5, 1512.0, 741.0, 1512.0, 741.0, 1479.0, 228.0, 1479.0, 228.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-194", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-194", 0 ],
					"source" : [ "obj-196", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 1659.0, 741.0, 1659.0, 741.0, 1629.0, 519.0, 1629.0, 519.0, 1272.0, 228.0, 1272.0, 228.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-197", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-197", 0 ],
					"source" : [ "obj-199", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 342.5, 1665.0, 228.0, 1665.0, 228.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-202", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-202", 0 ],
					"source" : [ "obj-204", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 1737.0, 228.0, 1737.0, 228.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-205", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-205", 0 ],
					"source" : [ "obj-207", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 342.5, 1812.0, 228.0, 1812.0, 228.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-208", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 304.5, 596.0, 211.0, 596.0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-208", 0 ],
					"source" : [ "obj-210", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 1590.0, 519.0, 1590.0, 519.0, 1590.0, 228.0, 1590.0, 228.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-211", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-211", 0 ],
					"source" : [ "obj-213", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 1819.5, 229.5, 1819.5, 229.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-214", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-214", 0 ],
					"source" : [ "obj-216", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 1916.5, 234.5, 1916.5, 234.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-217", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-217", 0 ],
					"source" : [ "obj-219", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 1993.5, 238.5, 1993.5, 238.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-220", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-220", 0 ],
					"source" : [ "obj-222", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 2069.5, 235.5, 2069.5, 235.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-223", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 0 ],
					"source" : [ "obj-225", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 2142.5, 245.5, 2142.5, 245.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-226", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-226", 0 ],
					"source" : [ "obj-228", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 2217.5, 224.5, 2217.5, 224.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-229", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 164.5, 849.0, 263.25, 849.0, 263.25, 621.0, 211.0, 621.0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-229", 0 ],
					"source" : [ "obj-231", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 2278.5, 233.5, 2278.5, 233.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-232", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-232", 0 ],
					"source" : [ "obj-234", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 2365.5, 232.5, 2365.5, 232.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-235", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-235", 0 ],
					"source" : [ "obj-237", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 2429.5, 231.5, 2429.5, 231.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-238", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-238", 0 ],
					"source" : [ "obj-240", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 0 ],
					"order" : 2,
					"source" : [ "obj-244", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-248", 0 ],
					"order" : 1,
					"source" : [ "obj-244", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-256", 0 ],
					"order" : 0,
					"source" : [ "obj-244", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-253", 0 ],
					"source" : [ "obj-246", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-250", 0 ],
					"source" : [ "obj-248", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-253", 0 ],
					"source" : [ "obj-250", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-253", 0 ],
					"source" : [ "obj-255", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-255", 0 ],
					"source" : [ "obj-256", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 2504.5, 228.5, 2504.5, 228.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-257", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-257", 0 ],
					"source" : [ "obj-259", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-26", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 780.5, 2575.5, 231.5, 2575.5, 231.5, 806.0, 164.5, 806.0 ],
					"source" : [ "obj-260", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-260", 0 ],
					"source" : [ "obj-262", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 335.5, 691.0, 289.0, 691.0, 289.0, 755.0, 164.5, 755.0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 624.25, 849.0, 551.75, 849.0, 551.75, 609.0, 211.0, 609.0 ],
					"order" : 1,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 1 ],
					"order" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"order" : 1,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"midpoints" : [ 270.5, 205.5, 560.5, 205.5 ],
					"order" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-4", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-242", 1 ],
					"order" : 1,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 184.0, 596.5, 211.0, 596.5 ],
					"order" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 1 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 593.5, 384.0, 959.5, 384.0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 560.5, 385.0, 959.5, 385.0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"midpoints" : [ 666.5, 307.0, 691.0, 307.0, 691.0, 268.0, 680.0, 268.0 ],
					"source" : [ "obj-49", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 71.5, 596.5, 211.0, 596.5 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 707.5, 389.5, 959.5, 389.5 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"order" : 1,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"order" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 1 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 415.0, 283.0, 303.125, 283.0, 303.125, 245.0, 187.5, 245.0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 1 ],
					"source" : [ "obj-61", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-61", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 2 ],
					"order" : 1,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"order" : 0,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 2 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 1 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 335.5, 767.0, 164.5, 767.0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 392.75, 212.0, 187.5, 212.0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 335.5, 832.0, 304.0, 832.0, 304.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-77", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 464.5, 244.0, 446.75, 244.0, 446.75, 207.5, 415.0, 207.5 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 17.0, 684.0, 141.0, 684.0, 141.0, 756.0, 164.5, 756.0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 335.5, 902.0, 304.0, 902.0, 304.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 17.0, 846.0, 141.0, 846.0, 141.0, 813.0, 164.5, 813.0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 17.0, 765.0, 147.0, 765.0, 147.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 30.5, 41.5, 593.5, 41.5 ],
					"order" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"order" : 1,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 423.5, 411.0, 396.0, 411.0, 396.0, 420.0, 304.5, 420.0 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 335.5, 972.0, 304.0, 972.0, 304.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 335.5, 1041.0, 304.0, 1041.0, 304.0, 804.0, 164.5, 804.0 ],
					"source" : [ "obj-98", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "cues_shanghai.txt",
				"bootpath" : "~/Dropbox/newDev/ozUnity_3LD/Max",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "oscProc.js",
				"bootpath" : "~/Dropbox/newDev/ozUnity_3LD/Max",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
