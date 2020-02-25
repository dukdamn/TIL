//
//  Data.swift
//  AlamofireTest
//
//  Created by 황정덕 on 2020/02/21.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation
import UIKit
let duci = Date(timeIntervalSince1970: 912151226) // 1970.01.01

let userData = """
[
{
name: "Cristea",
surname: "Răzvan",
gender: "male",
region: "Romania",
age: 22,
title: "mr",
phone: "(966) 720 1392",
birthday: {
dmy: "27/11/1998",
mdy: "11/27/1998",
raw: 912151226
},
email: "cristea-98@example.com",
password: "Răzvan98$+",
credit_card: {
expiration: "11/24",
number: "1644-2215-4905-4361",
pin: 1532,
security: 257
},
photo: "https://uinames.com/api/photos/male/3.jpg"
},
{
name: "Δήμος",
surname: "Αλαφούζος",
gender: "male",
region: "Greece",
age: 33,
title: "mr",
phone: "(657) 516 3330",
birthday: {
dmy: "24/03/1987",
mdy: "03/24/1987",
raw: 543582660
},
email: "Δήμος_87@example.com",
password: "Αλαφούζος87+^",
credit_card: {
expiration: "4/27",
number: "4901-6430-5327-2875",
pin: 8738,
security: 730
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Selena",
surname: "Martin",
gender: "female",
region: "Canada",
age: 28,
title: "ms",
phone: "(827) 323 4674",
birthday: {
dmy: "16/04/1992",
mdy: "04/16/1992",
raw: 703458340
},
email: "selena_92@example.com",
password: "Martin92=",
credit_card: {
expiration: "2/25",
number: "2267-8414-7449-3177",
pin: 2775,
security: 421
},
photo: "https://uinames.com/api/photos/female/16.jpg"
},
{
name: "Mateusz",
surname: "Szewczyk",
gender: "male",
region: "Poland",
age: 25,
title: "mr",
phone: "(736) 869 5467",
birthday: {
dmy: "10/04/1995",
mdy: "04/10/1995",
raw: 797561183
},
email: "mateusz_95@example.com",
password: "Szewczyk95(#",
credit_card: {
expiration: "2/25",
number: "2147-5693-6965-9090",
pin: 6863,
security: 928
},
photo: "https://uinames.com/api/photos/male/20.jpg"
},
{
name: "Alfie",
surname: "Williams",
gender: "male",
region: "England",
age: 36,
title: "mr",
phone: "(640) 393 4318",
birthday: {
dmy: "21/08/1984",
mdy: "08/21/1984",
raw: 461981900
},
email: "alfie84@example.com",
password: "Williams84^{",
credit_card: {
expiration: "9/24",
number: "8163-2166-1500-3599",
pin: 3063,
security: 100
},
photo: "https://uinames.com/api/photos/male/1.jpg"
},
{
name: "Sidhant",
surname: "Rayamajhee",
gender: "male",
region: "Nepal",
age: 27,
title: "mr",
phone: "(360) 698 6997",
birthday: {
dmy: "05/06/1993",
mdy: "06/05/1993",
raw: 739300786
},
email: "sidhant_93@example.com",
password: "Rayamajhee93=}",
credit_card: {
expiration: "10/23",
number: "2074-1635-9587-1099",
pin: 5409,
security: 602
},
photo: "https://uinames.com/api/photos/male/16.jpg"
},
{
name: "邓",
surname: "腾",
gender: "male",
region: "China",
age: 28,
title: "mr",
phone: "(342) 781 9455",
birthday: {
dmy: "03/12/1992",
mdy: "12/03/1992",
raw: 723426084
},
email: "邓.腾@example.com",
password: "腾92^)",
credit_card: {
expiration: "11/27",
number: "8715-7230-6369-5971",
pin: 3618,
security: 883
},
photo: "https://uinames.com/api/photos/male/18.jpg"
},
{
name: "Ricardo",
surname: "Velázquez",
gender: "male",
region: "Mexico",
age: 35,
title: "mr",
phone: "(910) 933 4224",
birthday: {
dmy: "23/06/1985",
mdy: "06/23/1985",
raw: 488417304
},
email: "ricardo_85@example.com",
password: "Velázquez85#~",
credit_card: {
expiration: "10/24",
number: "8010-4651-3606-9299",
pin: 7532,
security: 954
},
photo: "https://uinames.com/api/photos/male/1.jpg"
},
{
name: "Ελλάδιος",
surname: "Αλαβάνος",
gender: "male",
region: "Greece",
age: 35,
title: "mr",
phone: "(288) 953 8077",
birthday: {
dmy: "11/07/1985",
mdy: "07/11/1985",
raw: 489931031
},
email: "Ελλάδιος-85@example.com",
password: "Αλαβάνος85*=",
credit_card: {
expiration: "1/28",
number: "6441-2315-9374-3137",
pin: 1939,
security: 512
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Sergej",
surname: "Šulc",
gender: "male",
region: "Slovakia",
age: 31,
title: "mr",
phone: "(910) 264 4436",
birthday: {
dmy: "26/06/1989",
mdy: "06/26/1989",
raw: 614868054
},
email: "sergej_Šulc@example.com",
password: "Šulc89(+",
credit_card: {
expiration: "5/21",
number: "9435-6972-9638-6814",
pin: 3017,
security: 428
},
photo: "https://uinames.com/api/photos/male/3.jpg"
},
{
name: "Nicolae",
surname: "Mușat",
gender: "male",
region: "Romania",
age: 34,
title: "mr",
phone: "(341) 832 9261",
birthday: {
dmy: "22/12/1986",
mdy: "12/22/1986",
raw: 535671059
},
email: "nicolae_86@example.com",
password: "Mușat86}{",
credit_card: {
expiration: "6/21",
number: "9171-9786-2657-8976",
pin: 9881,
security: 873
},
photo: "https://uinames.com/api/photos/male/2.jpg"
},
{
name: "Jay",
surname: "Patel",
gender: "male",
region: "England",
age: 36,
title: "mr",
phone: "(118) 716 8500",
birthday: {
dmy: "04/09/1984",
mdy: "09/04/1984",
raw: 463174141
},
email: "jay.patel@example.com",
password: "Patel84@#",
credit_card: {
expiration: "3/24",
number: "9021-4679-6038-6651",
pin: 2458,
security: 842
},
photo: "https://uinames.com/api/photos/male/18.jpg"
},
{
name: "Ισαάκιος",
surname: "Πυλαρινός",
gender: "male",
region: "Greece",
age: 31,
title: "mr",
phone: "(791) 550 5421",
birthday: {
dmy: "02/06/1989",
mdy: "06/02/1989",
raw: 612770739
},
email: "Ισαάκιος_89@example.com",
password: "Πυλαρινός89{)",
credit_card: {
expiration: "7/24",
number: "6820-4996-9345-9461",
pin: 6437,
security: 893
},
photo: "https://uinames.com/api/photos/male/7.jpg"
},
{
name: "Hayden",
surname: "Voss",
gender: "male",
region: "New Zealand",
age: 31,
title: "mr",
phone: "(323) 914 2908",
birthday: {
dmy: "15/03/1989",
mdy: "03/15/1989",
raw: 605999199
},
email: "hayden_voss@example.com",
password: "Voss89+}",
credit_card: {
expiration: "2/25",
number: "7523-9787-6407-3255",
pin: 2322,
security: 286
},
photo: "https://uinames.com/api/photos/male/4.jpg"
},
{
name: "魏",
surname: "言",
gender: "male",
region: "China",
age: 24,
title: "mr",
phone: "(848) 564 8854",
birthday: {
dmy: "07/04/1996",
mdy: "04/07/1996",
raw: 828908267
},
email: "魏_言@example.com",
password: "言96+(",
credit_card: {
expiration: "11/25",
number: "1636-3179-3084-6164",
pin: 2250,
security: 780
},
photo: "https://uinames.com/api/photos/male/12.jpg"
},
{
name: "Δαμιανός",
surname: "Γούσιος",
gender: "male",
region: "Greece",
age: 28,
title: "mr",
phone: "(503) 609 2184",
birthday: {
dmy: "01/03/1992",
mdy: "03/01/1992",
raw: 699441258
},
email: "Δαμιανός_92@example.com",
password: "Γούσιος92%_",
credit_card: {
expiration: "4/27",
number: "4851-5299-3587-2166",
pin: 3309,
security: 812
},
photo: "https://uinames.com/api/photos/male/6.jpg"
},
{
name: "Sarah",
surname: "Vasquez",
gender: "female",
region: "United States",
age: 34,
title: "ms",
phone: "(946) 463 3595",
birthday: {
dmy: "30/10/1986",
mdy: "10/30/1986",
raw: 531054572
},
email: "sarah-86@example.com",
password: "Vasquez86~~",
credit_card: {
expiration: "8/24",
number: "6850-9282-6445-1841",
pin: 5064,
security: 863
},
photo: "https://uinames.com/api/photos/female/18.jpg"
},
{
name: "Jack",
surname: "Dean",
gender: "male",
region: "United States",
age: 34,
title: "mr",
phone: "(266) 221 9061",
birthday: {
dmy: "27/09/1986",
mdy: "09/27/1986",
raw: 528245857
},
email: "jackdean@example.com",
password: "Dean86_)",
credit_card: {
expiration: "10/24",
number: "4969-9947-2540-5543",
pin: 4717,
security: 351
},
photo: "https://uinames.com/api/photos/male/14.jpg"
},
{
name: "Csalogány",
surname: "Hanna",
gender: "female",
region: "Hungary",
age: 22,
title: "ms",
phone: "(587) 458 6360",
birthday: {
dmy: "15/08/1998",
mdy: "08/15/1998",
raw: 903199734
},
email: "csalogány98@example.com",
password: "Hanna98$(",
credit_card: {
expiration: "12/21",
number: "3812-8944-7913-6377",
pin: 7171,
security: 192
},
photo: "https://uinames.com/api/photos/female/5.jpg"
},
{
name: "Daniel",
surname: "Haas",
gender: "male",
region: "Germany",
age: 29,
title: "mr",
phone: "(379) 371 2030",
birthday: {
dmy: "29/04/1991",
mdy: "04/29/1991",
raw: 672911164
},
email: "daniel_haas@example.com",
password: "Haas91$(",
credit_card: {
expiration: "12/26",
number: "5694-6598-5746-9304",
pin: 3216,
security: 553
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Ευμένης",
surname: "Βαμβακάς",
gender: "male",
region: "Greece",
age: 30,
title: "mr",
phone: "(339) 575 4651",
birthday: {
dmy: "28/09/1990",
mdy: "09/28/1990",
raw: 654517461
},
email: "Ευμένης_90@example.com",
password: "Βαμβακάς90_+",
credit_card: {
expiration: "6/27",
number: "7586-5568-2921-1556",
pin: 1328,
security: 920
},
photo: "https://uinames.com/api/photos/male/16.jpg"
},
{
name: "Ashim",
surname: "Oli",
gender: "male",
region: "Nepal",
age: 28,
title: "mr",
phone: "(188) 980 7471",
birthday: {
dmy: "29/06/1992",
mdy: "06/29/1992",
raw: 709790752
},
email: "ashim-oli@example.com",
password: "Oli92&%",
credit_card: {
expiration: "7/26",
number: "7707-1072-2017-3216",
pin: 4438,
security: 903
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Bajro",
surname: "Kusturica",
gender: "male",
region: "Bosnia and Herzegovina",
age: 26,
title: "mr",
phone: "(166) 634 8914",
birthday: {
dmy: "08/11/1994",
mdy: "11/08/1994",
raw: 784306832
},
email: "bajro94@example.com",
password: "Kusturica94@~",
credit_card: {
expiration: "3/24",
number: "6543-8321-9194-9630",
pin: 1653,
security: 511
},
photo: "https://uinames.com/api/photos/male/10.jpg"
},
{
name: "魏",
surname: "永",
gender: "male",
region: "China",
age: 36,
title: "mr",
phone: "(211) 352 3900",
birthday: {
dmy: "10/06/1984",
mdy: "06/10/1984",
raw: 455695131
},
email: "魏永@example.com",
password: "永84*",
credit_card: {
expiration: "2/22",
number: "7441-2330-8975-4495",
pin: 8756,
security: 383
},
photo: "https://uinames.com/api/photos/male/14.jpg"
},
{
name: "Majzik",
surname: "Konrád",
gender: "male",
region: "Hungary",
age: 31,
title: "mr",
phone: "(143) 656 8241",
birthday: {
dmy: "05/07/1989",
mdy: "07/05/1989",
raw: 615669421
},
email: "majzik_89@example.com",
password: "Konrád89*#",
credit_card: {
expiration: "2/24",
number: "1854-2408-4752-1773",
pin: 2959,
security: 458
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Emil",
surname: "Grecu",
gender: "male",
region: "Romania",
age: 34,
title: "mr",
phone: "(758) 827 7741",
birthday: {
dmy: "31/10/1986",
mdy: "10/31/1986",
raw: 531139308
},
email: "emil-grecu@example.com",
password: "Grecu86==",
credit_card: {
expiration: "5/24",
number: "8942-8938-4466-3909",
pin: 5065,
security: 206
},
photo: "https://uinames.com/api/photos/male/10.jpg"
},
{
name: "Minodora",
surname: "Șerb",
gender: "female",
region: "Romania",
age: 25,
title: "ms",
phone: "(570) 360 4426",
birthday: {
dmy: "03/03/1995",
mdy: "03/03/1995",
raw: 794218943
},
email: "minodora_95@example.com",
password: "Șerb95_}",
credit_card: {
expiration: "1/27",
number: "3200-6686-7750-4815",
pin: 9361,
security: 928
},
photo: "https://uinames.com/api/photos/female/10.jpg"
},
{
name: "Douglas",
surname: "Carlson",
gender: "male",
region: "United States",
age: 33,
title: "mr",
phone: "(794) 637 8557",
birthday: {
dmy: "12/07/1987",
mdy: "07/12/1987",
raw: 553145064
},
email: "douglas-87@example.com",
password: "Carlson87+=",
credit_card: {
expiration: "1/22",
number: "4347-5251-1665-7822",
pin: 2270,
security: 283
},
photo: "https://uinames.com/api/photos/male/17.jpg"
},
{
name: "Rigoberto",
surname: "Durán",
gender: "male",
region: "Mexico",
age: 33,
title: "mr",
phone: "(127) 324 5069",
birthday: {
dmy: "07/07/1987",
mdy: "07/07/1987",
raw: 552714657
},
email: "rigoberto87@example.com",
password: "Durán87!",
credit_card: {
expiration: "3/28",
number: "3353-4778-8356-5944",
pin: 3090,
security: 585
},
photo: "https://uinames.com/api/photos/male/17.jpg"
},
{
name: "Severina",
surname: "Edeleanu",
gender: "female",
region: "Romania",
age: 33,
title: "ms",
phone: "(342) 385 5216",
birthday: {
dmy: "05/08/1987",
mdy: "08/05/1987",
raw: 555167409
},
email: "severina87@example.com",
password: "Edeleanu87)_",
credit_card: {
expiration: "4/23",
number: "6764-5108-4926-3952",
pin: 7425,
security: 747
},
photo: "https://uinames.com/api/photos/female/8.jpg"
},
{
name: "Δάμασος",
surname: "Βικελίδης",
gender: "male",
region: "Greece",
age: 26,
title: "mr",
phone: "(309) 950 3791",
birthday: {
dmy: "03/10/1994",
mdy: "10/03/1994",
raw: 781194961
},
email: "Δάμασος-94@example.com",
password: "Βικελίδης94((",
credit_card: {
expiration: "11/22",
number: "2258-1021-5389-8101",
pin: 1567,
security: 706
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Ευβουλέας",
surname: "Ασπάσιος",
gender: "male",
region: "Greece",
age: 31,
title: "mr",
phone: "(780) 143 1566",
birthday: {
dmy: "28/11/1989",
mdy: "11/28/1989",
raw: 628297638
},
email: "Ευβουλέας89@example.com",
password: "Ασπάσιος89&#",
credit_card: {
expiration: "10/22",
number: "1554-2277-1083-3782",
pin: 5111,
security: 326
},
photo: "https://uinames.com/api/photos/male/8.jpg"
},
{
name: "Αρκάς",
surname: "Δουμπιώτης",
gender: "male",
region: "Greece",
age: 25,
title: "mr",
phone: "(953) 242 7653",
birthday: {
dmy: "21/05/1995",
mdy: "05/21/1995",
raw: 801086582
},
email: "Αρκάς_95@example.com",
password: "Δουμπιώτης95$(",
credit_card: {
expiration: "1/24",
number: "3733-6252-3908-8941",
pin: 5311,
security: 901
},
photo: "https://uinames.com/api/photos/male/13.jpg"
},
{
name: "Timur",
surname: "Murtazaev",
gender: "male",
region: "Kyrgyz Republic",
age: 29,
title: "mr",
phone: "(532) 242 6414",
birthday: {
dmy: "04/04/1991",
mdy: "04/04/1991",
raw: 670781390
},
email: "timur_91@example.com",
password: "Murtazaev91)!",
credit_card: {
expiration: "8/21",
number: "7584-6321-7952-2733",
pin: 6407,
security: 520
},
photo: "https://uinames.com/api/photos/male/16.jpg"
},
{
name: "Guillermo",
surname: "Coronado",
gender: "male",
region: "Mexico",
age: 31,
title: "mr",
phone: "(738) 280 8766",
birthday: {
dmy: "04/02/1989",
mdy: "02/04/1989",
raw: 602576791
},
email: "guillermo-89@example.com",
password: "Coronado89*$",
credit_card: {
expiration: "11/23",
number: "6466-5019-1893-4029",
pin: 2538,
security: 176
},
photo: "https://uinames.com/api/photos/male/6.jpg"
},
{
name: "Víťazoslav",
surname: "Melicherík",
gender: "male",
region: "Slovakia",
age: 23,
title: "mr",
phone: "(305) 711 7043",
birthday: {
dmy: "08/04/1997",
mdy: "04/08/1997",
raw: 860545172
},
email: "víťazoslav_97@example.com",
password: "Melicherík97^",
credit_card: {
expiration: "2/21",
number: "1978-3450-8717-8906",
pin: 7699,
security: 874
},
photo: "https://uinames.com/api/photos/male/6.jpg"
},
{
name: "Cezar",
surname: "Cosmescu",
gender: "male",
region: "Romania",
age: 22,
title: "mr",
phone: "(822) 262 1910",
birthday: {
dmy: "19/11/1998",
mdy: "11/19/1998",
raw: 911489774
},
email: "cezar-98@example.com",
password: "Cosmescu98&+",
credit_card: {
expiration: "1/23",
number: "1262-3211-6132-7019",
pin: 1836,
security: 878
},
photo: "https://uinames.com/api/photos/male/4.jpg"
},
{
name: "Pavel",
surname: "Gănescu",
gender: "male",
region: "Romania",
age: 25,
title: "mr",
phone: "(438) 634 8850",
birthday: {
dmy: "24/11/1995",
mdy: "11/24/1995",
raw: 817205424
},
email: "pavel95@example.com",
password: "Gănescu95{{",
credit_card: {
expiration: "4/25",
number: "1667-8577-4957-8461",
pin: 8872,
security: 827
},
photo: "https://uinames.com/api/photos/male/6.jpg"
},
{
name: "Bryan",
surname: "Morgan",
gender: "male",
region: "United States",
age: 36,
title: "mr",
phone: "(869) 785 7592",
birthday: {
dmy: "20/05/1984",
mdy: "05/20/1984",
raw: 453877184
},
email: "bryanmorgan@example.com",
password: "Morgan84_",
credit_card: {
expiration: "8/23",
number: "1465-5378-4615-1173",
pin: 5864,
security: 475
},
photo: "https://uinames.com/api/photos/male/7.jpg"
},
{
name: "Tiffany",
surname: "Valdez",
gender: "female",
region: "United States",
age: 25,
title: "ms",
phone: "(512) 162 9661",
birthday: {
dmy: "07/09/1995",
mdy: "09/07/1995",
raw: 810510298
},
email: "tiffany-95@example.com",
password: "Valdez95&*",
credit_card: {
expiration: "10/28",
number: "1533-4719-8068-5933",
pin: 2396,
security: 887
},
photo: "https://uinames.com/api/photos/female/12.jpg"
},
{
name: "Irena",
surname: "Šváby",
gender: "female",
region: "Slovakia",
age: 26,
title: "ms",
phone: "(905) 841 5865",
birthday: {
dmy: "25/05/1994",
mdy: "05/25/1994",
raw: 769924680
},
email: "irena94@example.com",
password: "Šváby94&^",
credit_card: {
expiration: "12/28",
number: "2335-3135-2137-5196",
pin: 5795,
security: 894
},
photo: "https://uinames.com/api/photos/female/14.jpg"
},
{
name: "Málik",
surname: "Xaviér",
gender: "male",
region: "Hungary",
age: 27,
title: "mr",
phone: "(957) 670 1462",
birthday: {
dmy: "19/02/1993",
mdy: "02/19/1993",
raw: 730155309
},
email: "málik93@example.com",
password: "Xaviér93+)",
credit_card: {
expiration: "8/26",
number: "9209-7379-8345-9858",
pin: 5805,
security: 885
},
photo: "https://uinames.com/api/photos/male/16.jpg"
},
{
name: "Anton",
surname: "Bucurescu",
gender: "male",
region: "Romania",
age: 26,
title: "mr",
phone: "(727) 377 8886",
birthday: {
dmy: "23/02/1994",
mdy: "02/23/1994",
raw: 762043486
},
email: "anton-94@example.com",
password: "Bucurescu94=*",
credit_card: {
expiration: "2/23",
number: "3888-7335-1979-7226",
pin: 7717,
security: 752
},
photo: "https://uinames.com/api/photos/male/10.jpg"
},
{
name: "Sandu",
surname: "Fulga",
gender: "male",
region: "Romania",
age: 25,
title: "mr",
phone: "(329) 876 4796",
birthday: {
dmy: "05/01/1995",
mdy: "01/05/1995",
raw: 789366535
},
email: "sandu.fulga@example.com",
password: "Fulga95{*",
credit_card: {
expiration: "5/28",
number: "2145-4876-2225-7920",
pin: 8116,
security: 313
},
photo: "https://uinames.com/api/photos/male/5.jpg"
},
{
name: "Παναγιώτης",
surname: "Δουρέντης",
gender: "male",
region: "Greece",
age: 33,
title: "mr",
phone: "(594) 294 6826",
birthday: {
dmy: "18/01/1987",
mdy: "01/18/1987",
raw: 537957681
},
email: "Παναγιώτης-87@example.com",
password: "Δουρέντης87*}",
credit_card: {
expiration: "2/22",
number: "6255-1616-2456-5483",
pin: 7407,
security: 502
},
photo: "https://uinames.com/api/photos/male/1.jpg"
},
{
name: "Samu",
surname: "Dorina",
gender: "female",
region: "Hungary",
age: 33,
title: "ms",
phone: "(414) 874 8666",
birthday: {
dmy: "02/10/1987",
mdy: "10/02/1987",
raw: 560154879
},
email: "samudorina@example.com",
password: "Dorina87{}",
credit_card: {
expiration: "11/27",
number: "3121-2312-7395-3164",
pin: 1922,
security: 534
},
photo: "https://uinames.com/api/photos/female/17.jpg"
},
{
name: "Vratko",
surname: "Šima",
gender: "male",
region: "Slovakia",
age: 35,
title: "mr",
phone: "(531) 943 3082",
birthday: {
dmy: "04/07/1985",
mdy: "07/04/1985",
raw: 489365317
},
email: "vratko.Šima@example.com",
password: "Šima85**",
credit_card: {
expiration: "11/25",
number: "5798-2185-5209-1841",
pin: 8430,
security: 283
},
photo: "https://uinames.com/api/photos/male/12.jpg"
},
{
name: "허",
surname: "상현",
gender: "male",
region: "Korea",
age: 29,
title: "mr",
phone: "(227) 836 1854",
birthday: {
dmy: "08/05/1991",
mdy: "05/08/1991",
raw: 673706629
},
email: "허_상현@example.com",
password: "상현91_}",
credit_card: {
expiration: "6/27",
number: "3102-8268-3816-2534",
pin: 6911,
security: 388
},
photo: "https://uinames.com/api/photos/male/5.jpg"
},
{
name: "Harrison",
surname: "Allen",
gender: "male",
region: "New Zealand",
age: 27,
title: "mr",
phone: "(375) 606 6779",
birthday: {
dmy: "25/04/1993",
mdy: "04/25/1993",
raw: 735710569
},
email: "harrison_93@example.com",
password: "Allen93#!",
credit_card: {
expiration: "1/25",
number: "3813-4931-7233-5813",
pin: 4896,
security: 677
},
photo: "https://uinames.com/api/photos/male/14.jpg"
},
{
name: "Emel",
surname: "Şen",
gender: "female",
region: "Turkey",
age: 32,
title: "ms",
phone: "(997) 460 3184",
birthday: {
dmy: "01/06/1988",
mdy: "06/01/1988",
raw: 581206269
},
email: "emel_Şen@example.com",
password: "Şen88!=",
credit_card: {
expiration: "4/26",
number: "4314-2860-9268-6096",
pin: 5610,
security: 937
},
photo: "https://uinames.com/api/photos/female/24.jpg"
},
]
""".data(using: .utf8)!
