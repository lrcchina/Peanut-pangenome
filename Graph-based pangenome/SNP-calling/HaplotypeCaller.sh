conda activate gatk
ref=Tif_genome.fasta
for i in AS Dabaisha DL001 DL002 DL003 DL004 DL005 DL006 DL007 DL008 DL009 DL010 DL011 DL012 DL013 DL015 DL016 DL017 DL018 DL019 DL021 DL022 DL023 DL025 DL026 DL027 DL028 DL029 DL030 DL033 DL034 DL035 DL036 DL037 DL038 DL039 DL040 DL041 DL045 DL048 DL051 DL052 DL053 DL054 DL056 DL057 DL058 DL059 DL061 DL063 DL064 DL066 DL070 DL071 DL072 DL073 DL074 DL075 DL076 DL077 DL078 DL079 DL080 DL081 DL083 DL086 DL087 DL088 DL090 DL092 DL093 DL094 DL095 DL096 DL097 DL098 DL099 DL101 DL102 DL103 DL106 DL107 DL108 DL109 DL110 DL111 DL113 DL114 DL115 DL116 DL117 DL118 DL121 DL123 DL124 DL127 DL129 DL130 DL134 DL135 DL136 DL137 DL138 DL139 DL141 DL143 DL144 DL146 DL147 DL148 DL150 DL153 DL154 DL156 DL160 DL172 DL175 DL176 DL178 DL181 DL184 DL193 DL195 DL196 DL197 DL201 DL204 DL206 DL213 DL218 DL223 DL225 DL227 DL233 DL238 DL239 DL241 DL244 DL245 DL246 DL249 DL255 DL256 DL257 DL258 DL259 DL262 DL266 DL268 DL269 DL270 DL275 DL279 DL284 DL286 DL288 DL289 DL290 DL292 DL293 DL294 DL295 DL296 DL297 DL302 DL305 DL307 DL308 DL309 DL311 DL312 DL313 DL317 DL318 DL320 DL321 DL328 DL660 Fenghua3 Guihua17 Guihua771 gzys H002 Haihua1 huaihua-20 Huayu20 Huayu22 Huayu25 Huayu32 Huayu33 ICG_1000 ICG_10015 ICG_10037 ICG_10044 ICG_10074 ICG_10075 ICG_10083 ICG_10087 ICG_10097 ICG_10105 ICG_10107 ICG_10125 ICG_10130 ICG_10140 ICG_1014 ICG_10171 ICG_10183 ICG_10200 ICG_10205 ICG_10206 ICG_10222 ICG_10224 ICG_10230 ICG_10248 ICG_1024 ICG_10251 ICG_1026 ICG_10281 ICG_10282 ICG_10294 ICG_1029 ICG_102 ICG_1030 ICG_10336 ICG_10337 ICG_10340 ICG_10349 ICG_10353 ICG_10354 ICG_1035 ICG_10362 ICG_10363 ICG_10366 ICG_10371 ICG_10385 ICG_10395 ICG_10399 ICG_10402 ICG_10412 ICG_10413 ICG_10439 ICG_10440 ICG_10449 ICG_1044 ICG_10452 ICG_10462 ICG_10468 ICG_10469 ICG_1046 ICG_10471 ICG_10476 ICG_10478 ICG_10480 ICG_10481 ICG_10489 ICG_10495 ICG_10508 ICG_10511 ICG_10519 ICG_1051 ICG_10520 ICG_1052 ICG_10531 ICG_10548 ICG_10549 ICG_10556 ICG_10562 ICG_10565 ICG_10567 ICG_10573 ICG_10575 ICG_10576 ICG_10586 ICG_10589 ICG_10595 ICG_10616 ICG_10637 ICG_10661 ICG_10680 ICG_10690 ICG_10703 ICG_10704 ICG_10708 ICG_10709 ICG_1070 ICG_10739 ICG_10746 ICG_10749 ICG_10751 ICG_10770 ICG_10788 ICG_10792 ICG_107 ICG_10806 ICG_10831 ICG_10833 ICG_10836 ICG_10847 ICG_10848 ICG_10856 ICG_10870 ICG_10878 ICG_10886 ICG_10889 ICG_10895 ICG_1089 ICG_10900 ICG_10911 ICG_10912 ICG_10915 ICG_1092 ICG_10936 ICG_10942 ICG_10945 ICG_10949 ICG_10956 ICG_10992 ICG_10 ICG_11015 ICG_11030 ICG_11042 ICG_11043 ICG_11046 ICG_11059 ICG_11092 ICG_11105 ICG_11118 ICG_11122 ICG_11130 ICG_11133 ICG_1113 ICG_11168 ICG_11188 ICG_11198 ICG_11203 ICG_11209 ICG_11214 ICG_11217 ICG_1122 ICG_11237 ICG_11240 ICG_11253 ICG_11266 ICG_11267 ICG_1126 ICG_11270 ICG_11274 ICG_1128 ICG_11295 ICG_11300 ICG_11311 ICG_11313 ICG_11318 ICG_11319 ICG_11326 ICG_11346 ICG_11350 ICG_11362 ICG_11380 ICG_11398 ICG_1139 ICG_11427 ICG_11442 ICG_11452 ICG_11456 ICG_11461 ICG_11476 ICG_11478 ICG_11479 ICG_11484 ICG_11487 ICG_11489 ICG_114 ICG_11524 ICG_11525 ICG_11568 ICG_11569 ICG_11579 ICG_1157 ICG_11585 ICG_1158 ICG_11598 ICG_11605 ICG_11606 ICG_11620 ICG_11631 ICG_11633 ICG_11641 ICG_11646 ICG_11673 ICG_11715 ICG_11723 ICG_11726 ICG_11739 ICG_11743 ICG_11750 ICG_11756 ICG_11770 ICG_11805 ICG_11815 ICG_11816 ICG_11833 ICG_11834 ICG_11835 ICG_11848 ICG_11859 ICG_11895 ICG_11911 ICG_11914 ICG_11935 ICG_11939 ICG_11950 ICG_11966 ICG_1196 ICG_11972 ICG_11986 ICG_11987 ICG_12010 ICG_12027 ICG_12030 ICG_12035 ICG_12043 ICG_12050 ICG_12053 ICG_12054 ICG_12057 ICG_12063 ICG_1206 ICG_12076 ICG_12092 ICG_12104 ICG_12111 ICG_12112 ICG_12121 ICG_12127 ICG_12134 ICG_1213 ICG_12153 ICG_12155 ICG_12178 ICG_1218 ICG_12199 ICG_12217 ICG_12239 ICG_12251 ICG_12256 ICG_12260 ICG_12265 ICG_1227 ICG_12283 ICG_12313 ICG_12346 ICG_12355 ICG_12360 ICG_12377 ICG_1238 ICG_12392 ICG_12393 ICG_12415 ICG_1243 ICG_1245 ICG_12498 ICG_12499 ICG_1249 ICG_12510 ICG_12519 ICG_12520 ICG_12523 ICG_12539 ICG_12543 ICG_12550 ICG_12551 ICG_12553 ICG_12558 ICG_12560 ICG_12564 ICG_12566 ICG_1256 ICG_12578 ICG_12585 ICG_1258 ICG_12596 ICG_12615 ICG_1262 ICG_12647 ICG_1264 ICG_12654 ICG_1265 ICG_1266 ICG_12671 ICG_12673 ICG_12677 ICG_12680 ICG_12683 ICG_12687 ICG_12694 ICG_12702 ICG_1270 ICG_12710 ICG_12718 ICG_12719 ICG_12727 ICG_12743 ICG_12754 ICG_12755 ICG_127 ICG_12806 ICG_12808 ICG_12825 ICG_1283 ICG_12843 ICG_12848 ICG_12858 ICG_1286 ICG_12886 ICG_1291 ICG_12929 ICG_12951 ICG_12958 ICG_12963 ICG_12971 ICG_12980 ICG_12982 ICG_1298 ICG_12999 ICG_13012 ICG_13027 ICG_13049 ICG_13054 ICG_13057 ICG_13059 ICG_13091 ICG_13093 ICG_13097 ICG_13126 ICG_13135 ICG_13138 ICG_131 ICG_13271 ICG_13284 ICG_13288 ICG_13308 ICG_13336 ICG_13347 ICG_13360 ICG_13364 ICG_13396 ICG_13415 ICG_13420 ICG_13422 ICG_13427 ICG_13430 ICG_13434 ICG_13451 ICG_13461 ICG_13465 ICG_13469 ICG_13477 ICG_13479 ICG_13513 ICG_13517 ICG_13533 ICG_13539 ICG_13562 ICG_13581 ICG_13585 ICG_13600 ICG_13606 ICG_13627 ICG_13630 ICG_1363 ICG_13647 ICG_1364 ICG_13656 ICG_13658 ICG_1365 ICG_13660 ICG_13663 ICG_13667 ICG_13684 ICG_13694 ICG_13710 ICG_1371 ICG_13724 ICG_13731 ICG_13749 ICG_13750 ICG_13761 ICG_13773 ICG_13774 ICG_13775 ICG_13798 ICG_13810 ICG_13827 ICG_13829 ICG_13833 ICG_13834 ICG_1384 ICG_13855 ICG_13866 ICG_13872 ICG_13887 ICG_13907 ICG_13941 ICG_13961 ICG_13974 ICG_13994 ICG_139 ICG_14007 ICG_14008 ICG_14014 ICG_14026 ICG_14029 ICG_14043 ICG_14050 ICG_14056 ICG_14063 ICG_14066 ICG_14089 ICG_14091 ICG_14102 ICG_14111 ICG_14116 ICG_14129 ICG_14149 ICG_1417 ICG_14180 ICG_14185 ICG_14186 ICG_14193 ICG_141 ICG_14204 ICG_1420 ICG_14210 ICG_14214 ICG_14242 ICG_14250 ICG_14267 ICG_14270 ICG_14273 ICG_14291 ICG_1431 ICG_14323 ICG_14324 ICG_14325 ICG_14329 ICG_14343 ICG_14353 ICG_14359 ICG_14384 ICG_1438 ICG_14390 ICG_14393 ICG_14404 ICG_14416 ICG_14451 ICG_1445 ICG_14462 ICG_14477 ICG_1449 ICG_14527 ICG_14532 ICG_14535 ICG_1456 ICG_14573 ICG_14576 ICG_1457 ICG_14583 ICG_14591 ICG_14600 ICG_14619 ICG_14621 ICG_1462 ICG_14666 ICG_14677 ICG_1467 ICG_14684 ICG_14689 ICG_14691 ICG_14696 ICG_14708 ICG_1470 ICG_14722 ICG_14766 ICG_14779 ICG_14782 ICG_14788 ICG_14795 ICG_14814 ICG_14815 ICG_14835 ICG_14849 ICG_14852 ICG_14966 ICG_14975 ICG_14976 ICG_14979 ICG_14984 ICG_15003 ICG_15016 ICG_15021 ICG_15025 ICG_15029 ICG_1502 ICG_15032 ICG_15043 ICG_15051 ICG_15053 ICG_15061 ICG_15070 ICG_15091 ICG_15093 ICG_1509 ICG_15129 ICG_15181 ICG_15193 ICG_15198 ICG_15199 ICG_151 ICG_15203 ICG_15205 ICG_15206 ICG_15216 ICG_15221 ICG_15223 ICG_15224 ICG_15246 ICG_15251 ICG_15273 ICG_15297 ICG_15302 ICG_15311 ICG_15316 ICG_15320 ICG_15325 ICG_1533 ICG_153 ICG_1567 ICG_1576 ICG_1577 ICG_157 ICG_1596 ICG_1616 ICG_1617 ICG_1622 ICG_1633 ICG_1643 ICG_1661 ICG_1662 ICG_1676 ICG_1680 ICG_1683 ICG_1709 ICG_1710 ICG_1719 ICG_171 ICG_1721 ICG_172 ICG_1731 ICG_1737 ICG_1747 ICG_1754 ICG_1756 ICG_1760 ICG_1764 ICG_1766 ICG_177 ICG_1796 ICG_1800 ICG_1824 ICG_1829 ICG_1845 ICG_1849 ICG_185 ICG_1865 ICG_1866 ICG_1867 ICG_1869 ICG_1887 ICG_1888 ICG_1899 ICG_189 ICG_1908 ICG_1936 ICG_1941 ICG_1946 ICG_1949 ICG_1956 ICG_1966 ICG_1975 ICG_1977 ICG_1988 ICG_19 ICG_1 ICG_200 ICG_2039 ICG_2046 ICG_2057 ICG_2080 ICG_2115 ICG_2122 ICG_2129 ICG_2130 ICG_2132 ICG_2140 ICG_2145 ICG_2149 ICG_2158 ICG_2159 ICG_2161 ICG_2177 ICG_2201 ICG_221 ICG_2221 ICG_2226 ICG_2232 ICG_2233 ICG_225 ICG_2266 ICG_2267 ICG_2272 ICG_2279 ICG_2282 ICG_2285 ICG_2303 ICG_230 ICG_2312 ICG_2320 ICG_2322 ICG_2333 ICG_2336 ICG_2343 ICG_2344 ICG_2350 ICG_2360 ICG_2377 ICG_2386 ICG_23 ICG_240 ICG_2414 ICG_2417 ICG_2422 ICG_2427 ICG_2428 ICG_2432 ICG_2434 ICG_2444 ICG_2463 ICG_246 ICG_2498 ICG_2506 ICG_2508 ICG_2516 ICG_2529 ICG_2548 ICG_2561 ICG_2572 ICG_2591 ICG_2602 ICG_2606 ICG_261 ICG_2628 ICG_262 ICG_2640 ICG_2642 ICG_2654 ICG_2666 ICG_2677 ICG_2678 ICG_2679 ICG_267 ICG_26 ICG_2706 ICG_2708 ICG_2721 ICG_2738 ICG_2753 ICG_276 ICG_2779 ICG_2788 ICG_2794 ICG_2806 ICG_2816 ICG_2822 ICG_282 ICG_2842 ICG_2845 ICG_2854 ICG_286 ICG_2876 ICG_2880 ICG_2886 ICG_2942 ICG_2973 ICG_2999 ICG_29 ICG_3003 ICG_3011 ICG_3014 ICG_3024 ICG_3032 ICG_3039 ICG_3046 ICG_304 ICG_3054 ICG_3058 ICG_305 ICG_3064 ICG_3084 ICG_3086 ICG_308 ICG_3104 ICG_3115 ICG_3125 ICG_312 ICG_3134 ICG_3171 ICG_3174 ICG_317 ICG_3188 ICG_318 ICG_3192 ICG_3200 ICG_3204 ICG_3208 ICG_3210 ICG_3219 ICG_3224 ICG_3232 ICG_3243 ICG_3247 ICG_3287 ICG_3292 ICG_3301 ICG_3307 ICG_3311 ICG_3330 ICG_3331 ICG_3334 ICG_3344 ICG_3355 ICG_3364 ICG_3369 ICG_3376 ICG_3389 ICG_3390 ICG_341 ICG_3422 ICG_3429 ICG_3439 ICG_3445 ICG_3461 ICG_3475 ICG_3477 ICG_3491 ICG_3502 ICG_3509 ICG_3510 ICG_3527 ICG_3529 ICG_353 ICG_3540 ICG_3544 ICG_3546 ICG_3557 ICG_3565 ICG_356 ICG_3575 ICG_3580 ICG_3582 ICG_3593 ICG_35 ICG_3600 ICG_3605 ICG_3631 ICG_3646 ICG_3649 ICG_3655 ICG_3660 ICG_3662 ICG_3665 ICG_3682 ICG_3696 ICG_3709 ICG_3711 ICG_3713 ICG_3726 ICG_3728 ICG_3730 ICG_3731 ICG_3741 ICG_3747 ICG_3751 ICG_3757 ICG_376 ICG_3773 ICG_3774 ICG_3779 ICG_3783 ICG_3791 ICG_3805 ICG_3812 ICG_3819 ICG_3825 ICG_3829 ICG_382 ICG_3849 ICG_3865 ICG_3872 ICG_3877 ICG_3889 ICG_389 ICG_3909 ICG_3920 ICG_3944 ICG_3960 ICG_3967 ICG_3978 ICG_3984 ICG_3987 ICG_398 ICG_3995 ICG_4041 ICG_4054 ICG_4056 ICG_4057 ICG_4058 ICG_4077 ICG_4087 ICG_4099 ICG_4107 ICG_4109 ICG_4112 ICG_4116 ICG_4149 ICG_414 ICG_4150 ICG_4154 ICG_4161 ICG_4162 ICG_4170 ICG_4178 ICG_4192 ICG_4196 ICG_4210 ICG_4211 ICG_421 ICG_4221 ICG_4224 ICG_4225 ICG_4235 ICG_4243 ICG_4250 ICG_4255 ICG_4270 ICG_4276 ICG_4286 ICG_4304 ICG_4331 ICG_4339 ICG_4346 ICG_4352 ICG_4373 ICG_4426 ICG_445 ICG_4466 ICG_4475 ICG_4478 ICG_4482 ICG_4487 ICG_4508 ICG_450 ICG_4534 ICG_4536 ICG_4537 ICG_4546 ICG_4558 ICG_4564 ICG_457 ICG_4589 ICG_4590 ICG_4593 ICG_4604 ICG_4619 ICG_4625 ICG_4631 ICG_4645 ICG_4646 ICG_4667 ICG_466 ICG_4673 ICG_4690 ICG_4692 ICG_469 ICG_4720 ICG_4731 ICG_4734 ICG_4738 ICG_473 ICG_4743 ICG_4744 ICG_4749 ICG_4765 ICG_4777 ICG_4787 ICG_4788 ICG_4790 ICG_4815 ICG_4818 ICG_4821 ICG_4831 ICG_4833 ICG_4856 ICG_4860 ICG_4863 ICG_4875 ICG_4879 ICG_4886 ICG_4890 ICG_4896 ICG_4917 ICG_4918 ICG_491 ICG_4927 ICG_4934 ICG_4935 ICG_4943 ICG_4958 ICG_4981 ICG_4988 ICG_4991 ICG_4992 ICG_4 ICG_5005 ICG_5046 ICG_5048 ICG_5050 ICG_5055 ICG_5058 ICG_5066 ICG_5073 ICG_5076 ICG_5079 ICG_5080 ICG_5094 ICG_5115 ICG_5133 ICG_5136 ICG_5147 ICG_5149 ICG_5157 ICG_5163 ICG_5170 ICG_5171 ICG_5173 ICG_517 ICG_5181 ICG_5194 ICG_5210 ICG_5225 ICG_522 ICG_5232 ICG_5233 ICG_5238 ICG_5242 ICG_5244 ICG_5276 ICG_5294 ICG_5308 ICG_5334 ICG_5362 ICG_536 ICG_5375 ICG_5390 ICG_5402 ICG_5406 ICG_5414 ICG_5418 ICG_5434 ICG_543 ICG_5440 ICG_5444 ICG_544 ICG_5454 ICG_5462 ICG_5468 ICG_5473 ICG_5483 ICG_5493 ICG_5496 ICG_5512 ICG_5523 ICG_5525 ICG_5533 ICG_5560 ICG_5561 ICG_5588 ICG_5598 ICG_5607 ICG_5608 ICG_5611 ICG_5623 ICG_5649 ICG_5657 ICG_5690 ICG_56 ICG_5704 ICG_5714 ICG_5748 ICG_5766 ICG_5770 ICG_5774 ICG_5806 ICG_5834 ICG_5837 ICG_5862 ICG_5865 ICG_5881 ICG_5907 ICG_5914 ICG_5916 ICG_5929 ICG_5930 ICG_5940 ICG_5964 ICG_5975 ICG_5978 ICG_5982 ICG_5984 ICG_5995 ICG_5 ICG_6016 ICG_6021 ICG_602 ICG_6031 ICG_6035 ICG_6039 ICG_6047 ICG_6052 ICG_6071 ICG_60 ICG_6100 ICG_6106 ICG_6123 ICG_6130 ICG_6143 ICG_6148 ICG_6150 ICG_6164 ICG_6166 ICG_6180 ICG_618 ICG_6190 ICG_6203 ICG_6206 ICG_6207 ICG_6220 ICG_6221 ICG_6237 ICG_6240 ICG_6241 ICG_6255 ICG_625 ICG_6273 ICG_6274 ICG_6276 ICG_6295 ICG_6303 ICG_6331 ICG_6336 ICG_6339 ICG_6340 ICG_6343 ICG_6350 ICG_6353 ICG_6354 ICG_6359 ICG_6361 ICG_6367 ICG_6369 ICG_636 ICG_6390 ICG_641 ICG_6421 ICG_6438 ICG_6441 ICG_6451 ICG_6459 ICG_6466 ICG_6498 ICG_6508 ICG_6515 ICG_6524 ICG_6536 ICG_653 ICG_6554 ICG_6565 ICG_6570 ICG_6573 ICG_6585 ICG_6589 ICG_6593 ICG_6596 ICG_6616 ICG_6625 ICG_6636 ICG_6638 ICG_6640 ICG_664 ICG_6666 ICG_6679 ICG_6686 ICG_6706 ICG_670 ICG_6721 ICG_6724 ICG_6725 ICG_6741 ICG_6754 ICG_6780 ICG_6801 ICG_6804 ICG_6811 ICG_6834 ICG_6867 ICG_6871 ICG_6877 ICG_6878 ICG_6892 ICG_6898 ICG_690 ICG_6913 ICG_6914 ICG_692 ICG_6952 ICG_6971 ICG_6985 ICG_6987 ICG_6990 ICG_6993 ICG_6996 ICG_6997 ICG_7000 ICG_7005 ICG_700 ICG_7010 ICG_7013 ICG_7026 ICG_7051 ICG_7058 ICG_7070 ICG_7082 ICG_7090 ICG_7116 ICG_711 ICG_7123 ICG_7124 ICG_7125 ICG_7131 ICG_7166 ICG_718 ICG_7198 ICG_7199 ICG_7207 ICG_7216 ICG_7229 ICG_722 ICG_723 ICG_7240 ICG_7253 ICG_725 ICG_7262 ICG_7263 ICG_7278 ICG_7279 ICG_7282 ICG_7283 ICG_7285 ICG_7293 ICG_72 ICG_7320 ICG_7331 ICG_7337 ICG_7340 ICG_7347 ICG_7349 ICG_7352 ICG_7355 ICG_7358 ICG_7361 ICG_737 ICG_7392 ICG_7409 ICG_7411 ICG_7416 ICG_7424 ICG_7425 ICG_7445 ICG_7446 ICG_7458 ICG_7463 ICG_7477 ICG_7480 ICG_7485 ICG_7488 ICG_7496 ICG_7502 ICG_7503 ICG_7504 ICG_7522 ICG_7524 ICG_7562 ICG_7586 ICG_7594 ICG_7629 ICG_7661 ICG_7676 ICG_7680 ICG_7690 ICG_7692 ICG_7696 ICG_7721 ICG_7723 ICG_7735 ICG_7742 ICG_7748 ICG_7755 ICG_7762 ICG_7774 ICG_7776 ICG_7777 ICG_7778 ICG_7779 ICG_777 ICG_7780 ICG_7785 ICG_7791 ICG_779 ICG_7808 ICG_7812 ICG_7838 ICG_783 ICG_7845 ICG_7849 ICG_7858 ICG_7864 ICG_7869 ICG_7872 ICG_7875 ICG_7877 ICG_7882 ICG_7884 ICG_7893 ICG_7898 ICG_7900 ICG_7905 ICG_7915 ICG_7918 ICG_791 ICG_7922 ICG_7929 ICG_7930 ICG_7932 ICG_7934 ICG_7967 ICG_7973 ICG_7976 ICG_7981 ICG_7982 ICG_7986 ICG_8004 ICG_8019 ICG_8023 ICG_8044 ICG_8069 ICG_806 ICG_8073 ICG_8074 ICG_8081 ICG_8122 ICG_819 ICG_8229 ICG_8233 ICG_8239 ICG_8243 ICG_8249 ICG_824 ICG_8250 ICG_8268 ICG_8290 ICG_8294 ICG_8305 ICG_8308 ICG_8317 ICG_8330 ICG_8345 ICG_8353 ICG_8359 ICG_835 ICG_8360 ICG_8363 ICG_8399 ICG_8401 ICG_8405 ICG_8414 ICG_8421 ICG_8422 ICG_8438 ICG_843 ICG_8455 ICG_8459 ICG_8470 ICG_8479 ICG_847 ICG_8485 ICG_8486 ICG_8494 ICG_8496 ICG_8499 ICG_8501 ICG_8511 ICG_8514 ICG_8544 ICG_8570 ICG_8578 ICG_8585 ICG_8586 ICG_8589 ICG_858 ICG_85 ICG_8607 ICG_861 ICG_8623 ICG_8633 ICG_8661 ICG_8662 ICG_8666 ICG_8670 ICG_8685 ICG_8687 ICG_86 ICG_8703 ICG_8713 ICG_8717 ICG_8748 ICG_8766 ICG_8768 ICG_8795 ICG_8797 ICG_8798 ICG_8802 ICG_8813 ICG_8818 ICG_881 ICG_8826 ICG_8833 ICG_8835 ICG_8874 ICG_8881 ICG_8895 ICG_896 ICG_8983 ICG_8991 ICG_8994 ICG_8 ICG_9004 ICG_9014 ICG_9018 ICG_9027 ICG_9038 ICG_9041 ICG_9047 ICG_9057 ICG_905 ICG_9066 ICG_9077 ICG_9078 ICG_9091 ICG_9095 ICG_9098 ICG_9107 ICG_9113 ICG_9127 ICG_9130 ICG_9141 ICG_9144 ICG_9151 ICG_9152 ICG_9157 ICG_9159 ICG_9178 ICG_9185 ICG_9191 ICG_9194 ICG_9230 ICG_9236 ICG_9239 ICG_9247 ICG_9256 ICG_9262 ICG_9266 ICG_9275 ICG_9304 ICG_9306 ICG_9307 ICG_9308 ICG_9309 ICG_9329 ICG_9332 ICG_9333 ICG_9340 ICG_9343 ICG_9346 ICG_9359 ICG_935 ICG_9363 ICG_9377 ICG_939 ICG_9401 ICG_9414 ICG_9417 ICG_9422 ICG_9427 ICG_9428 ICG_9432 ICG_9437 ICG_9453 ICG_9478 ICG_9497 ICG_9501 ICG_9515 ICG_9537 ICG_9553 ICG_9556 ICG_9563 ICG_956 ICG_9570 ICG_9585 ICG_9596 ICG_960 ICG_9668 ICG_966 ICG_9677 ICG_9681 ICG_9691 ICG_9695 ICG_9706 ICG_9712 ICG_9729 ICG_9732 ICG_9738 ICG_9752 ICG_9754 ICG_9761 ICG_9762 ICG_9778 ICG_978 ICG_9794 ICG_9799 ICG_9814 ICG_9817 ICG_9823 ICG_982 ICG_9833 ICG_9839 ICG_9846 ICG_9860 ICG_9862 ICG_9873 ICG_9876 ICG_9899 ICG_9907 ICG_9909 ICG_9910 ICG_991 ICG_9929 ICG_9930 ICG_9943 ICG_9948 ICG_9949 ICG_994 ICG_9953 ICG_995 ICG_9962 ICG_9968 ICG_9975 ICG_9976 ICG_997 ICG_9989 ICG_99 Jhua11 Jhua8 Jihua1206 Jihua1209 Jihua1211 Jihua8 Kangqing Luhua10 Luhua11 Luhua13 luohua-4087 Qinghua7 SA001 SA002 SA003 SA005 SA006 SA007 SA008 SA009 SA011 SA012 SA013 SA014 SA016 SA020 SA021 SA022 SA024 SA025 SA026 SA027 SA028 SA029 SA030 SA036 SA039 SA040 SA042 SA044 SA045 SA047 SA048 SA049 SA051 SA052 SA055 SA056 SA057 SA058 SA059 SA060 SA062 SA063 SA064 SA065 SA066 SA069 SA070 SA072 SA073 SA075 SA076 SA077 SA078 SA080 SA081 SA082 SA083 SA085 SA086 SA087 SA088 SA090 SA091 SA092 SA093 SA094 SA095 SA097 SA098 SA100 SA101 SA102 SA103 SA105 SA106 SA107 SA108 SA109 SA111 SA114 SA116 SA117 SA118 SA119 SA120 SA121 SA122 SA123 SA126 SA127 SA129 SA130 SA131 SA132 SA133 SA134 SA135 SA136 SA138 SA140 SA141 SA144 SA145 SA146 SA147 SA148 SA150 SA151 SA152 SA153 SA154 SA155 SA156 SA157 SA158 SA159 SA160 SA161 SA162 SA164 SA168 SA169 SA171 SA172 SA173 SA178 SA179 SA180 SA181 SA182 SA183 SA184 SA187 SA191 SA193 SA194 SA196 SA197 SA199 SA200 SA201 SA207 SA208 SA209 SA210 SA211 SA212 SA213 SA214 SA215 SA216 SA217 SA219 SA220 SA222 SA224 SA225 SA226 SA227 SA228 SA229 SA230 SA231 SA233 SA236 SA237 SA238 SA239 SA240 SA241 SA242 SA243 SA244 SA245 SA246 SA247 SA248 SA249 SA250 SA251 SA253 SA254 SA255 SA256 SA257 SA258 SA259 SA260 SA261 SA263 SA265 SA266 SA268 SA269 SA270 SA271 SA273 SA274 SA276 SA277 SA279 SA281 SA282 SA283 SA285 SA288 SA289 SA290 SA291 SA292 SA294 SA296 SA297 SA298 SA301 SA302 SA303 SA306 SA308 SA310 SA312 SA313 SA314 SA316 SA317 SA318 SA319 SA320 SA322 SA323 SA324 SA325 SA327 SA328 SA329 SA330 SA331 SA332 SA333 SA336 SA338 SA339 SA340 SA341 SA342 SA346 SA347 SA348 SA350 SA351 SA352 SA353 SA355 SA356 SA357 SA358 SA359 SA360 SA361 SA362 SA363 SA364 SA365 SA366 SA367 SA368 SA369 SA370 SA371 SA372 SA373 SA374 SA375 SA376 SA377 SA378 SA379 SA380 SA381 SA382 SA383 SA384 SA385 SA387 SA388 SA389 SA390 SA391 SA392 SA393 SA394 SA395 SA396 SA397 SA398 SA399 SA400 SA401 SA402 SA403 SA404 SA405 SA406 SA407 SA408 SA409 SA410 SA411 SA412 SA413 SA414 SA415 SA416 SA419 SA420 SA421 SA422 SA423 SA424 SA425 SA427 SA428 SA429 SA430 SA431 SA432 SA433 SA434 SA435 SA436 SA437 SA438 SA439 SA440 SA441 SA442 SA443 SA444 SA445 SA446 SA447 SA448 SA449 SA450 SA451 SA453 SA454 SA455 SA456 SA457 SA458 SA459 SA460 SA461 SA462 SA463 SA464 SA466 SA467 SA468 SA469 SA470 SA471 SA472 SA473 SA474 SA475 SA476 SA477 SA478 SA479 SA481 SA482 SA483 SA486 SA488 SA489 SA490 SA491 SA492 SA493 SA494 SA495 SA496 SA497 SA498 SA499 SA500 SA502 SA504 SA505 SA506 SA507 SA508 SA509 SA510 SA512 SA513 SA514 SA515 SA516 SA517 SA518 SA519 SA520 SA522 SA523 SA524 SA525 SA526 SA527 SA528 SA529 SA530 SA531 SA533 SA534 SA535 SA536 SA537 SA538 SA539 SA540 SA541 SA542 SA543 SA544 SA545 SA546 SA547 SA548 SA549 SA550 SA551 SA552 SA553 SA555 SA556 SA558 SA559 SA560 SA561 SA562 SA564 SA565 SA566 SA567 SA568 SA570 SA571 SA572 SA573 SA575 SA576 SA578 SA579 SA580 SA581 SA582 SA583 SA586 SA587 SA588 SA589 SA590 SA591 SA592 SA593 SA594 SA595 SA596 SA597 SA598 SA600 SA601 SA602 SA604 SA605 SA607 SA608 SA609 SA610 SA611 SA612 SA613 SA617 SA618 SA626 SA627 SA628 SA643 SA644 SA651 SA653 SA654 SA655 SA661 SA662 SA664 SA665 SA666 SA667 SA668 SA669 SA671 SA672 SA677 SA679 SA680 SA683 SA685 SA686 SA688 SA690 SA692 SA694 SA696 SA698 SA699 SA700 SA705 SA706 SA708 SA709 SA710 SA725 SA726 SA728 SA729 SA730 SA731 SA737 SA741 SA744 SA745 SA753 SA756 SA758 SA760 SA761 SA762 SA765 SA766 SA770 SA775 SA778 SA780 SA781 SA782 SA783 SA784 SA787 SA788 SA789 SA790 SA791 SA792 SA793 SA796 SA797 SA798 SA799 SA800 SA807 SA810 SA812 SA814 SA815 SA818 SA820 SA822 SA825 SA842 SA843 SA845 SA846 SA847 SA848 SA849 SA855 SA856 SA857 SA860 SA861 SA867 SA868 SA869 SA870 SA873 SA890 SA922 Shanhua11 shanhua-7 Shitouqi tianfu-18 Tif Weihua15 Weihua25 Weihua29 Xianghua2008 xianghua-819 Xiangxiang Xiaobaisha Yhua125 Yhua91 Yueyou551 Yuhua11 Yuhua3 Yuhua9326 Yuhua9 Zhaiye Zhanhei1 Zhanhong5 Zhanyou16 Zhanyou75 ZhengNhua13 zhonghua-8 zhongkaihua-4
do
echo "/software/gatk-4.4.0.0/gatk --java-options \"-Xmx500m -Djava.io.tmpdir=./\"  HaplotypeCaller -R $ref -I ../bam/out.${i}_tag.bam -O gatk${i}_raw.vcf.gz -ERC GVCF"
done > calling_HaplotypeCaller.sh
ParaFly -c calling_HaplotypeCaller.sh -CPU 80
