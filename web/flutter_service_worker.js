'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "ea03c502b6dfe97c98fb396f38bd0689",
"assets/AssetManifest.bin.json": "36c30a9dbea9f0c78cffa3119c62b4a1",
"assets/AssetManifest.json": "d132253fa43043fa0b81f84582752611",
"assets/assets/images/alphabet/A.png": "7e10fc70d05ddf427a17bbbfe4564228",
"assets/assets/images/alphabet/Alphabet.jpg": "f78d8c492dce97f636bd2f6dd92647d2",
"assets/assets/images/alphabet/B.png": "759a9b4a72688e69f9f4e89fe8b3918b",
"assets/assets/images/alphabet/C.png": "5be254c18a7c22054552fcf780ff3800",
"assets/assets/images/alphabet/D.png": "1f2409b05ce8e2150aff3e4e8d04ab8d",
"assets/assets/images/alphabet/E.png": "90d6a5c5337cd2e3c0f62e53593b72a0",
"assets/assets/images/alphabet/F.png": "93a5319a4ab846009ae8fd48ffe2bd2b",
"assets/assets/images/alphabet/G.png": "397470207c28eb947adf7a91b87a8db8",
"assets/assets/images/alphabet/H.png": "dbd380c05cdba3b908747d54e11defee",
"assets/assets/images/alphabet/I.png": "6c9ccc50c47ca99de5bf1e04113135f5",
"assets/assets/images/alphabet/J.png": "981273d6dbda2e6c1ddaa6725fc4b618",
"assets/assets/images/alphabet/K.png": "a06767aa2bf0fb1855222a3c20b4487a",
"assets/assets/images/alphabet/L.png": "319e9e9b6e574fba0ba6b005af573a3c",
"assets/assets/images/alphabet/M.png": "20c983a423d66609f7efe057c1673f32",
"assets/assets/images/alphabet/N.png": "32c76943564d5693098558ddda715967",
"assets/assets/images/alphabet/O.png": "c3b9be7f8f8c2a5010b1438f6501753c",
"assets/assets/images/alphabet/P.png": "12b743224e4fb51432998ab2c8765f1b",
"assets/assets/images/alphabet/Q.png": "5db16f89a23cd5c4fc67423cd2509f87",
"assets/assets/images/alphabet/R.png": "358dde2f01ce09b2b537b33a17024162",
"assets/assets/images/alphabet/S.png": "6b38c1b2b79bbe20478251b078b2dd91",
"assets/assets/images/alphabet/T.png": "846ec5780eb07a9837b7df1b2b01f7d0",
"assets/assets/images/alphabet/U.png": "ed42a208b4d4be971b69c1de157589c7",
"assets/assets/images/alphabet/V.png": "3205a1af82fd57a86d971052402ead0d",
"assets/assets/images/alphabet/W.png": "bfd6194e91e40226197361e3039135af",
"assets/assets/images/alphabet/X.png": "b4ab3de4731d28c7a230b2205725436b",
"assets/assets/images/alphabet/Y.png": "ad8b05f6b4aec092b812231c8e73a329",
"assets/assets/images/alphabet/Z.png": "3095ecd06ebfdfdd56c384e938a8a071",
"assets/assets/images/animals/animals.jpg": "c73cd8b03cc35621ae45b31c2aff1f2c",
"assets/assets/images/animals/bear.png": "ab9b6067fbc7e8ea1a0d3f70d3d48bed",
"assets/assets/images/animals/cat.png": "b683788bf174e73ec3281c0f33cfecce",
"assets/assets/images/animals/chicken.png": "f4f6c09604def377e06de03b04c465b6",
"assets/assets/images/animals/cow.png": "269b6228501713fe0214e0758200df72",
"assets/assets/images/animals/deer.png": "f900d6b57e4e63ce96c3a4b3fbd1619b",
"assets/assets/images/animals/dog.png": "3a936380a83ff7c6b9b6ae2e5047bf4d",
"assets/assets/images/animals/duck.png": "955d68e12d7c592472ae0554f62604ed",
"assets/assets/images/animals/elephant.png": "782ef56d69da5211681f1591f408c6ac",
"assets/assets/images/animals/fox.png": "327cc56ce4afa0d4fee66b434ee0646f",
"assets/assets/images/animals/giraffe.png": "a211f8857af7812698e3a670e36fc14a",
"assets/assets/images/animals/horse.png": "781045b85836156f953840fe6405a880",
"assets/assets/images/animals/lion.png": "c27260256bb8df13f83500480e7f88fb",
"assets/assets/images/animals/monkey.png": "c8d072361a0f961345776c208633ca79",
"assets/assets/images/animals/panda.png": "764a3fe3b91438618f4afeff1a1b9033",
"assets/assets/images/animals/pig.png": "7f072e198c3767e5cf627b54e6a7ff2d",
"assets/assets/images/animals/rabbit.png": "d91d741426463e624fbd11ab25449792",
"assets/assets/images/animals/sheep.png": "0edc52086f23162ecfdb377f5014b851",
"assets/assets/images/animals/tiger.png": "d907ec461fbfa0f172a1098a0d9e9324",
"assets/assets/images/animals/wolf.png": "e854016edc98d23c0ee68e781c5cf9d1",
"assets/assets/images/animals/zebra.png": "d3d93142901b43b88ed462237f0ce31f",
"assets/assets/images/body/arm.png": "194be18a6168ceedc7843516bbde60c7",
"assets/assets/images/body/chest.png": "85dfa4532ff3d4e3984f99b3e904e44f",
"assets/assets/images/body/ear.png": "a04e378d4acb8c1df8707762155f1d78",
"assets/assets/images/body/elbow.png": "4c0fd2daad814619d8c628aa33ced5bf",
"assets/assets/images/body/eye.png": "ce86ff70d2739b6b21bf8a7583987a77",
"assets/assets/images/body/face.jpg": "1823a9840d2bf489519630cf74d4ea68",
"assets/assets/images/body/finger.png": "a92512ac7d0f06cfe08f0813bdf0f39e",
"assets/assets/images/body/foot.png": "cb9fea26d67fc4624564825b4431b1c1",
"assets/assets/images/body/hair.png": "da4d71d36fbcc4b9cc6ff96d4d34b226",
"assets/assets/images/body/hand.png": "7639201c74a93fedce9899d0bf3c624f",
"assets/assets/images/body/head.png": "47d07acfb6d6be2d0cf0b2241e928af6",
"assets/assets/images/body/heart.png": "057b6cfea642b673fe6b9a287128a201",
"assets/assets/images/body/knee.png": "206c4ac1645d85570543b3c484145806",
"assets/assets/images/body/leg.jpg": "109a762c45cbd215f47b682db783905a",
"assets/assets/images/body/mouth.png": "fc773349839d4be5055eb06ba8138bc4",
"assets/assets/images/body/neck.png": "7faad77207f073331eef57b1a4f76c3a",
"assets/assets/images/body/nose.png": "7f160782e19151794e3b186f6747a0c7",
"assets/assets/images/body/shoulder.png": "663e9393e059441e3ecbf1a37d289b4a",
"assets/assets/images/body/stomach.png": "d99fc55db3c0065192567bec77a94c44",
"assets/assets/images/body/theback.png": "2aedaf4f883c360d037eba97b602b504",
"assets/assets/images/body/thebelly.png": "b02be353bea36986f8793d8c2e90fae8",
"assets/assets/images/colors/beige.png": "418af0a49608429e935d298833c19fd4",
"assets/assets/images/colors/black.png": "5e695fd624bce471c0c64f9a02293036",
"assets/assets/images/colors/blue.png": "42d7f68b0b80fbaa4fb5d5f0961f799e",
"assets/assets/images/colors/brown.png": "00ed33a5b6c41e8e9777e6ef4d002162",
"assets/assets/images/colors/dark_blue.png": "fe454f1de04c30d51c231913763ba7c8",
"assets/assets/images/colors/dark_green.png": "f40d72c50ed09ba3885a4585ae4f64f0",
"assets/assets/images/colors/gold.png": "cecacc123bab8cce67ea61e7e8b5cd49",
"assets/assets/images/colors/green.png": "ef692d896ca3c781b035710f8d06def7",
"assets/assets/images/colors/grey.png": "968ed97bd222dd3ac90bb4ac409fd083",
"assets/assets/images/colors/light_blue.png": "68600476e6ff29de22ce3e4c826db067",
"assets/assets/images/colors/light_green.png": "69e5b7ac7e4c16053ec5c162e16630bf",
"assets/assets/images/colors/magenta.png": "1e7b669145b3057766e5ec594fc950b9",
"assets/assets/images/colors/orange.png": "7656ce687a92a8e4d7fd69241bf49539",
"assets/assets/images/colors/pink.png": "ee9fed435f8feb53090ba8b1bb6cc39a",
"assets/assets/images/colors/purple.png": "bc5ceb20cd91ee10829a34453288de45",
"assets/assets/images/colors/rainbow.jpg": "dd635d1befde368cac0362812d237ef3",
"assets/assets/images/colors/red.png": "108acc3fb27ff0bec997e0f0b77ca6bf",
"assets/assets/images/colors/silver.png": "85de58640480fab6a74c82da33849f82",
"assets/assets/images/colors/violet.png": "d5247f1fb1a8632016fbc7e7e2f09235",
"assets/assets/images/colors/white.png": "ac63f50a893c272f8472bce6b22371ab",
"assets/assets/images/colors/yellow.png": "98cfa7cdeaef703be2abf1529ad61f55",
"assets/assets/images/default/default.png": "2da1bebc7539a76a491135338ebe4e75",
"assets/assets/images/emotions/angry.png": "fef5f593e461afaca9ff2317fa740841",
"assets/assets/images/emotions/bored.png": "3a30b5d41b10ca6c18ce4df6e3047914",
"assets/assets/images/emotions/confused.jpg": "af7424957d43885d517ff3ad70e50476",
"assets/assets/images/emotions/emotions.jpg": "91234b64e8b833c26d86f3ee70eeb574",
"assets/assets/images/emotions/excited.jpg": "e0537186fb0e0055d9cb401dfd130036",
"assets/assets/images/emotions/happy.jpg": "a3654bae94d753d5c52d01fda41bce57",
"assets/assets/images/emotions/proud.png": "d26e431b717020c860673ec2165fd937",
"assets/assets/images/emotions/sad.png": "01e09e9cf0c46f2b32ace6ea1037eb8d",
"assets/assets/images/emotions/scared.png": "91a86b04140317adfa700831ee737f93",
"assets/assets/images/emotions/surprised.png": "b827bc7a34d1a074d57429c4aafaf9fd",
"assets/assets/images/emotions/tired.png": "ca5759db9bc7ef7dbf0494c9499bc8bb",
"assets/assets/images/farm_animals/cat.png": "8e0ad7e6484d94f82bcd04b17c0f15ec",
"assets/assets/images/farm_animals/cow.png": "26ba1c2827f966850798e0752ec0e4cd",
"assets/assets/images/farm_animals/dog.png": "3ae7a8b326f3b089b7e859601733e49a",
"assets/assets/images/farm_animals/donkey.png": "53ddf2032ca0269e94be36d43e5e291a",
"assets/assets/images/farm_animals/duck.png": "35df9acd0918f52473f17fd9aa427102",
"assets/assets/images/farm_animals/farmanimals.jpg": "d7471ea6f73ab0982146fac15b6af15a",
"assets/assets/images/farm_animals/goat.png": "256da79ca87b6129d4d05be248480e2d",
"assets/assets/images/farm_animals/goose.png": "cecf84e6c5f3c2db6f620e5e999aeea9",
"assets/assets/images/farm_animals/horse.png": "f105f2a49f29d2c6d6fdca2d596810b7",
"assets/assets/images/farm_animals/pig.png": "04cf95ea39ab4e15d266a9147f6654fe",
"assets/assets/images/farm_animals/rabbit.png": "93aa5a17f767efeab8bfa1c8b021b7ad",
"assets/assets/images/farm_animals/rooster.png": "d960f688a7451adbf5202a1359bec2c2",
"assets/assets/images/farm_animals/sheep.png": "bca0ab419bc6a96fd4c89f7d14968765",
"assets/assets/images/farm_animals/turkey.png": "c9acd299d16a2411cce06d02c5ecc1b2",
"assets/assets/images/flowers/cherry_blossom.png": "35aec0f14f110164add9c7cd6e4dd43f",
"assets/assets/images/flowers/daisy.png": "7310532389785d0d89295e39edb5371b",
"assets/assets/images/flowers/flowers.jpg": "e140be24bda05cc7201a4c82902dcf42",
"assets/assets/images/flowers/lavender.png": "fde0c33cf6f9954e70cf893894232600",
"assets/assets/images/flowers/lily.png": "b66f5e779eaa5e0afe169da1698affd5",
"assets/assets/images/flowers/lotus.png": "22eaf667d2a385c4a8f7b15e870fc497",
"assets/assets/images/flowers/marigold.png": "aae885d76ca2533914c7af9b905d7078",
"assets/assets/images/flowers/orchid.png": "a65868d89f9711121bb4e342c8699df7",
"assets/assets/images/flowers/peony.png": "5fae58f1d14a240a9b47e41ff96b17df",
"assets/assets/images/flowers/rose.png": "73e898c0fc250830094072e562eb0e3a",
"assets/assets/images/flowers/sunflower.png": "6242696ccb6fd82374b163bd8ed83b4a",
"assets/assets/images/flowers/tulip.png": "c85ddf05b6f48a0b2281dd3bbbf23968",
"assets/assets/images/fruits/apple.png": "cb001dac88c5c718803b743f2185a9c5",
"assets/assets/images/fruits/avocado.png": "ba4d6c5912b01f366e954bc071a1af17",
"assets/assets/images/fruits/banana.png": "0f95facb0ce2ae97138350b706815497",
"assets/assets/images/fruits/cherry.png": "3287711511c38142f7b26c63cc239b6c",
"assets/assets/images/fruits/coconut.png": "6b0dc3ca5f62224cda47675b3e3fabfe",
"assets/assets/images/fruits/dragon_fruit.png": "7c4c1b79d3200e0ea53534eabd4dec12",
"assets/assets/images/fruits/durian.png": "3ebd33c6e8b9d28bc642aea715d126ec",
"assets/assets/images/fruits/fruits.jpg": "f24160899427080e6680153107fcb940",
"assets/assets/images/fruits/grapes.png": "bb36ba0dded591e9a70b6eb94061e45f",
"assets/assets/images/fruits/guava.png": "076c9a965b02fcb26d955c6eb9b70f11",
"assets/assets/images/fruits/kiwi.png": "6c3c1e782631d82c7db72e2e636a23f1",
"assets/assets/images/fruits/lychee.png": "0f9c527ae85aed8488824b5778ab577f",
"assets/assets/images/fruits/mango.png": "3c154741b2fb68ae7b95407e4da3618f",
"assets/assets/images/fruits/orange.png": "144bb04dfc8bd394f16b9daf0d330dc0",
"assets/assets/images/fruits/papaya.png": "003054f271105c4704331531d85e41ac",
"assets/assets/images/fruits/pear.png": "28b755ddb7d73ecbe99a3bb0aafae53c",
"assets/assets/images/fruits/pineapple.png": "562839b4f6800b4c8d4cadb97ac0cf39",
"assets/assets/images/fruits/rambutan.png": "3ea4ec722bbc2a6bd08ce8e319a733a9",
"assets/assets/images/fruits/strawberry.png": "8f5a07b0a197ec951d34fa440c3f8405",
"assets/assets/images/fruits/watermelon.png": "acbd4875503b097edda5875536204efb",
"assets/assets/images/jobs/artist.png": "9bd0557c01719f9deca401ffc92dfa86",
"assets/assets/images/jobs/chef.png": "deea91bbf10f95a037b4cfd8942aa9a5",
"assets/assets/images/jobs/doctor.png": "07609db9186082de42ab225b6aaaca52",
"assets/assets/images/jobs/engineer.png": "5cb672c95ff9454fc1a4bb162360f074",
"assets/assets/images/jobs/farmer.png": "e86d243b7aa4c4b8b58bed89a1355261",
"assets/assets/images/jobs/firefighter.png": "7d793b24d7db9abb04f421e302802844",
"assets/assets/images/jobs/jobs.jpg": "217b72801f9c095f5b554e1b9a51392b",
"assets/assets/images/jobs/nurse.jpg": "eff966351d6281f769251005153e800d",
"assets/assets/images/jobs/pilot.jpg": "a0ff30ce026cb6067760a5b74ebf0986",
"assets/assets/images/jobs/policeofficer.png": "1b917fbc6178704b62ca86a6100c06c0",
"assets/assets/images/jobs/teacher.png": "3445878024811ab5d28c771d8b7ae6d5",
"assets/assets/images/schoolsupplies/calculator.png": "96c666cc348f1e533c726b5a565c1ce5",
"assets/assets/images/schoolsupplies/crayons.png": "33da36ff7908f28ebe0c87112600e0ae",
"assets/assets/images/schoolsupplies/eraser.png": "aa79f6dbc72cdb66badefd668b12a34b",
"assets/assets/images/schoolsupplies/notebook.png": "fa3d99f2e337928420a28ef17d5dde1b",
"assets/assets/images/schoolsupplies/pag.png": "1259a19ab861c29e7842efef7ee05c5d",
"assets/assets/images/schoolsupplies/pen.jpg": "7e2384a3e42e7ef368f0155ce5535f69",
"assets/assets/images/schoolsupplies/pencil.png": "f8daf5434f233c8385037138a57502b6",
"assets/assets/images/schoolsupplies/ruler.png": "9772d127b3cf2c87324a7fb26ed23d7b",
"assets/assets/images/schoolsupplies/schoolsupplies.jpg": "cc81e81e7669513871ffe1bba8a9ec44",
"assets/assets/images/schoolsupplies/scissors.png": "e6a4d090afe7e31279feeb206aafe3fa",
"assets/assets/images/schoolsupplies/sharpener.png": "fcad716fb47ab90ade8fd932b6afae92",
"assets/assets/images/sea_animals/clownfish.png": "e06bbe84f7f1d057bc74ca34b57c964b",
"assets/assets/images/sea_animals/coral.png": "0edc432893fe6c593da69b46c7c9e334",
"assets/assets/images/sea_animals/crab.png": "df363496d02e2be2be1f662356ba8c79",
"assets/assets/images/sea_animals/dolphin.png": "49d860db2d2e4fd93e3176a15207a3ad",
"assets/assets/images/sea_animals/jellyfish.jpg": "61de798f6c1f48469f2513cb10e64dd3",
"assets/assets/images/sea_animals/lobster.png": "f5ce1f3dc7ba49be796b53f6a896da62",
"assets/assets/images/sea_animals/octopus.png": "d2d98e4cba331b68bb03f2997fa743a6",
"assets/assets/images/sea_animals/sea.jpg": "2197b43c6c8a53191e262cd483794fa5",
"assets/assets/images/sea_animals/seahorse.png": "4a8b71f87bd1e8b7d1cdd7b51899c91e",
"assets/assets/images/sea_animals/seal.png": "fa0087ea8ada9e26edcf6bdf8bbc26d6",
"assets/assets/images/sea_animals/shark.png": "0c79c953d923c9c4a6fb13f9a5214c60",
"assets/assets/images/sea_animals/squid.png": "a4e762a7ad64be3247d75dcbf29fcc04",
"assets/assets/images/sea_animals/starfish.png": "d011465a655c97b0d24d34a584edcab0",
"assets/assets/images/sea_animals/tuna.png": "906876818755cbf70036124ef81e76a1",
"assets/assets/images/sea_animals/turtle.png": "52cf1af878142585794e11e0e31f2412",
"assets/assets/images/sea_animals/whale.png": "6b8cc3c6e2d5c3e142c971da1e9585ab",
"assets/assets/images/transport/airplane.png": "e825369832dfb7f81e049e816f504d5c",
"assets/assets/images/transport/bicycle.png": "97bd60fa2e8c8daae739b5ad8eb16539",
"assets/assets/images/transport/boat.png": "9ba79bfd9e8337fff02d131e000ade3c",
"assets/assets/images/transport/bus.png": "a25a732bd76cc3f33d29c9440fad5d4d",
"assets/assets/images/transport/car.png": "d57fe52f866b1aab57849dcadfec9e1b",
"assets/assets/images/transport/helicopter.png": "10d8cc672a5061d8f6690738233237bc",
"assets/assets/images/transport/motorbike.png": "e91910c0fc8169c95e60c376e0d207dd",
"assets/assets/images/transport/subway.png": "e3cdeb6c7cb2f83423e9a17dd79224f5",
"assets/assets/images/transport/taxi.png": "393032f4bf92ee3aa82b165e328dd7b3",
"assets/assets/images/transport/train.png": "63472e0a3b512ebc5a4b689c66437922",
"assets/assets/images/transport/transport.jpg": "b58aa183f9e7209e46aaa3a99281aac6",
"assets/assets/images/vegetables/broccoli.png": "0d3e92012da0600f598e71b1521ced01",
"assets/assets/images/vegetables/carrot.png": "0cd0de090594a81adc1db176cadd2b40",
"assets/assets/images/vegetables/corn.png": "50d3ee051001c3c3a09e70bfe359507f",
"assets/assets/images/vegetables/cucumber.png": "c2bca543c9806fd05244736b01629f85",
"assets/assets/images/vegetables/eggplant.png": "e39550a2cd5402627a93fe9bc8391f00",
"assets/assets/images/vegetables/lettuce.jpg": "ab37099ea7135c0fabde16038b08c54c",
"assets/assets/images/vegetables/onion.png": "3b0bdcd081ab38ccce235b0e119d895e",
"assets/assets/images/vegetables/papaya.png": "b60240ddb18fd8ab7c274b7df5037ab9",
"assets/assets/images/vegetables/potato.png": "2c7dd10ac162b4f0959cf22f57dbaff7",
"assets/assets/images/vegetables/tomato.png": "cc02acb20a6304a921e075b24d6fb3d7",
"assets/assets/images/vegetables/vege.jpg": "78d67e2e2ef0b9b3dd7517ffd97f3a26",
"assets/assets/images/weather/cloudy.png": "54c08bdea86ee50aee15ff2b265eda11",
"assets/assets/images/weather/cold.jpg": "cfd7d06492403336b24189ebe9a0aa5b",
"assets/assets/images/weather/foggy.png": "91574ba4b1fe1ea00a1c03e25e0cb4b9",
"assets/assets/images/weather/hot.png": "8ae679a060942d0d37129e735c1c111e",
"assets/assets/images/weather/rainbow.png": "610db69b408c468964c6aedd11fbc24e",
"assets/assets/images/weather/rainy.png": "df8c193f6fb2cbc981d6db05efcd90ec",
"assets/assets/images/weather/snowy.png": "e13fbcbd054cb176625f5235739d04b4",
"assets/assets/images/weather/stormy.png": "49adeee5a8d9dc6e79e976da146e1647",
"assets/assets/images/weather/sunny.png": "14e746158ecee2622dd6216c4a76f520",
"assets/assets/images/weather/weather.jpg": "41762ef09a8c7707e73670250d3ba819",
"assets/assets/images/weather/windy.png": "aaf6aa4421743963626965a582e61675",
"assets/assets/langs/en.json": "30a34192c8acdc9dbcd3bb0e82485ec0",
"assets/assets/langs/vi.json": "d72451ee693c39c83f6e308854f6395f",
"assets/assets/privacy/privacy_policy.html": "b3022f1ba68aa09822344030d73f12d4",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "cd298046a07af059c7b8b9155d852426",
"assets/NOTICES": "61223758fbc2ac3db9b4ae1f2edfc4c0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "53cbf6b120fcaa5f3a798559d3b2fddd",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "910e6228eb81e4cbd469fd4d9bcca17f",
"/": "910e6228eb81e4cbd469fd4d9bcca17f",
"main.dart.js": "f45a857422df4c69d893e909bf139809",
"manifest.json": "107f40df36355e058ab10e7bb6f3f86b",
"privacy_policy.html": "b3022f1ba68aa09822344030d73f12d4",
"version.json": "e8854ac39d441609b9d9891ee734ba28"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
