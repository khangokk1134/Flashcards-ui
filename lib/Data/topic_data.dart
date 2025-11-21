/// 📘 Dữ liệu flashcard cho từng chủ đề (song ngữ)
/// 📘 Flashcard data for each topic (bilingual)

/// Mỗi mục gồm:
/// - name: từ tiếng Anh
/// - img: đường dẫn ảnh
/// - desc_en: mô tả tiếng Anh
/// - desc_vi: mô tả tiếng Việt

final Map<String, List<Map<String, String>>> topicData = {
  "Alphabet": [
    {'name': 'A', 'img': 'assets/images/alphabet/A.png', 'desc_en': 'Apple', 'desc_vi': 'Quả táo'},
    {'name': 'B', 'img': 'assets/images/alphabet/B.png', 'desc_en': 'Ball', 'desc_vi': 'Quả bóng'},
    {'name': 'C', 'img': 'assets/images/alphabet/C.png', 'desc_en': 'Car', 'desc_vi': 'Xe hơi'},
    {'name': 'D', 'img': 'assets/images/alphabet/D.png', 'desc_en': 'Duck', 'desc_vi': 'Con vịt'},
    {'name': 'E', 'img': 'assets/images/alphabet/E.png', 'desc_en': 'Elephant', 'desc_vi': 'Con voi'},
    {'name': 'F', 'img': 'assets/images/alphabet/F.png', 'desc_en': 'Fish', 'desc_vi': 'Con cá'},
    {'name': 'G', 'img': 'assets/images/alphabet/G.png', 'desc_en': 'Giraffe', 'desc_vi': 'Hươu cao cổ'},
    {'name': 'H', 'img': 'assets/images/alphabet/H.png', 'desc_en': 'House', 'desc_vi': 'Ngôi nhà'},
    {'name': 'I', 'img': 'assets/images/alphabet/I.png', 'desc_en': 'Ice cream', 'desc_vi': 'Kem'},
    {'name': 'J', 'img': 'assets/images/alphabet/J.png', 'desc_en': 'Jeep', 'desc_vi': 'Xe jeep'},
    {'name': 'K', 'img': 'assets/images/alphabet/K.png', 'desc_en': 'Kite', 'desc_vi': 'Con diều'},
    {'name': 'L', 'img': 'assets/images/alphabet/L.png', 'desc_en': 'Letter', 'desc_vi': 'Chữ cái'},
    {'name': 'M', 'img': 'assets/images/alphabet/M.png', 'desc_en': 'Monkey', 'desc_vi': 'Con khỉ'},
    {'name': 'N', 'img': 'assets/images/alphabet/N.png', 'desc_en': 'Notebook', 'desc_vi': 'Vở ghi'},
    {'name': 'O', 'img': 'assets/images/alphabet/O.png', 'desc_en': 'Owl', 'desc_vi': 'Con cú mèo'},
    {'name': 'P', 'img': 'assets/images/alphabet/P.png', 'desc_en': 'Pineapple', 'desc_vi': 'Quả dứa'},
    {'name': 'Q', 'img': 'assets/images/alphabet/Q.png', 'desc_en': 'Question mark', 'desc_vi': 'Dấu hỏi'},
    {'name': 'R', 'img': 'assets/images/alphabet/R.png', 'desc_en': 'Rabbit', 'desc_vi': 'Con thỏ'},
    {'name': 'S', 'img': 'assets/images/alphabet/S.png', 'desc_en': 'Strawberry', 'desc_vi': 'Dâu tây'},
    {'name': 'T', 'img': 'assets/images/alphabet/T.png', 'desc_en': 'Tortoise', 'desc_vi': 'Rùa cạn'},
    {'name': 'U', 'img': 'assets/images/alphabet/U.png', 'desc_en': 'Umbrella', 'desc_vi': 'Cái ô'},
    {'name': 'V', 'img': 'assets/images/alphabet/V.png', 'desc_en': 'Voyage', 'desc_vi': 'Chuyến đi'},
    {'name': 'W', 'img': 'assets/images/alphabet/W.png', 'desc_en': 'Watermelon', 'desc_vi': 'Dưa hấu'},
    {'name': 'X', 'img': 'assets/images/alphabet/X.png', 'desc_en': 'Xmas', 'desc_vi': 'Giáng sinh'},
    {'name': 'Y', 'img': 'assets/images/alphabet/Y.png', 'desc_en': 'Yacht', 'desc_vi': 'Du thuyền'},
    {'name': 'Z', 'img': 'assets/images/alphabet/Z.png', 'desc_en': 'Zebra', 'desc_vi': 'Ngựa vằn'},
  ],

  "Animals": [
    {'name': 'Fox', 'img': 'assets/images/animals/fox.png', 'desc_en': 'A small wild animal with a bushy tail', 'desc_vi': 'Một loài động vật hoang nhỏ có đuôi rậm'},
    {'name': 'Lion', 'img': 'assets/images/animals/lion.png', 'desc_en': 'The king of the jungle', 'desc_vi': 'Chúa sơn lâm'},
    {'name': 'Panda', 'img': 'assets/images/animals/panda.png', 'desc_en': 'A black and white bear from China', 'desc_vi': 'Gấu trúc đen trắng đến từ Trung Quốc'},
    {'name': 'Tiger', 'img': 'assets/images/animals/tiger.png', 'desc_en': 'A large wild cat with stripes', 'desc_vi': 'Một loài mèo hoang lớn có sọc'},
    {'name': 'Wolf', 'img': 'assets/images/animals/wolf.png', 'desc_en': 'A wild animal similar to a dog', 'desc_vi': 'Động vật hoang giống chó'},
    {'name': 'Zebra', 'img': 'assets/images/animals/zebra.png', 'desc_en': 'An African animal with black and white stripes', 'desc_vi': 'Động vật châu Phi có sọc đen trắng'},
    {'name': 'Elephant', 'img': 'assets/images/animals/elephant.png', 'desc_en': 'A large animal with a trunk', 'desc_vi': 'Một loài động vật lớn có vòi'},
    {'name': 'Giraffe', 'img': 'assets/images/animals/giraffe.png', 'desc_en': 'An African animal with a very long neck', 'desc_vi': 'Động vật châu Phi có cổ rất dài'},
    {'name': 'Bear', 'img': 'assets/images/animals/bear.png', 'desc_en': 'A large animal that lives in forests and mountains', 'desc_vi': 'Động vật to sống trong rừng và núi'},
    {'name': 'Monkey', 'img': 'assets/images/animals/monkey.png', 'desc_en': 'A playful animal that lives in trees', 'desc_vi': 'Động vật vui nhộn sống trên cây'},
    {'name': 'Dog', 'img': 'assets/images/animals/dog.png', 'desc_en': 'A loyal domestic animal', 'desc_vi': 'Động vật nuôi trung thành'},
    {'name': 'Cat', 'img': 'assets/images/animals/cat.png', 'desc_en': 'A small domestic animal that likes to purr', 'desc_vi': 'Động vật nhỏ thích kêu rừ rừ'},
    {'name': 'Rabbit', 'img': 'assets/images/animals/rabbit.png', 'desc_en': 'A small animal with long ears', 'desc_vi': 'Động vật nhỏ có tai dài'},
    {'name': 'Horse', 'img': 'assets/images/animals/horse.png', 'desc_en': 'A strong animal used for riding', 'desc_vi': 'Động vật mạnh mẽ dùng để cưỡi'},
    {'name': 'Deer', 'img': 'assets/images/animals/deer.png', 'desc_en': 'A graceful animal with antlers', 'desc_vi': 'Động vật thanh nhã có sừng'},
    {'name': 'Cow', 'img': 'assets/images/animals/cow.png', 'desc_en': 'A farm animal that gives milk', 'desc_vi': 'Động vật nuôi cho sữa'},
    {'name': 'Pig', 'img': 'assets/images/animals/pig.png', 'desc_en': 'A pink farm animal', 'desc_vi': 'Động vật nuôi có da màu hồng'},
    {'name': 'Sheep', 'img': 'assets/images/animals/sheep.png', 'desc_en': 'A farm animal with thick wool', 'desc_vi': 'Động vật nuôi có lông dày'},
    {'name': 'Duck', 'img': 'assets/images/animals/duck.png', 'desc_en': 'A bird that swims and quacks', 'desc_vi': 'Chim biết bơi và kêu cạp cạp'},
    {'name': 'Chicken', 'img': 'assets/images/animals/chicken.png', 'desc_en': 'A common farm bird', 'desc_vi': 'Loài gia cầm phổ biến'},
  ],


  "Sea animals": [
    {'name': 'Dolphin', 'img': 'assets/images/sea_animals/dolphin.png', 'desc_en': 'A smart sea animal', 'desc_vi': 'Động vật biển thông minh'},
    {'name': 'Seal', 'img': 'assets/images/sea_animals/seal.png', 'desc_en': 'A sea animal with flippers', 'desc_vi': 'Động vật biển có chân chèo'},
    {'name': 'Tuna', 'img': 'assets/images/sea_animals/tuna.png', 'desc_en': 'A large fast fish', 'desc_vi': 'Cá lớn bơi nhanh'},
    {'name': 'Turtle', 'img': 'assets/images/sea_animals/turtle.png', 'desc_en': 'A slow sea animal with a shell', 'desc_vi': 'Động vật biển chậm có mai'},
    {'name': 'Octopus', 'img': 'assets/images/sea_animals/octopus.png', 'desc_en': 'A sea animal with eight arms', 'desc_vi': 'Động vật biển có tám xúc tu'},
    {'name': 'Shark', 'img': 'assets/images/sea_animals/shark.png', 'desc_en': 'A big fish with sharp teeth', 'desc_vi': 'Cá lớn có răng sắc nhọn'},
    {'name': 'Whale', 'img': 'assets/images/sea_animals/whale.png', 'desc_en': 'The largest animal in the ocean', 'desc_vi': 'Động vật lớn nhất đại dương'},
    {'name': 'Crab', 'img': 'assets/images/sea_animals/crab.png', 'desc_en': 'A small sea animal with claws', 'desc_vi': 'Động vật nhỏ có càng'},
    {'name': 'Lobster', 'img': 'assets/images/sea_animals/lobster.png', 'desc_en': 'A sea animal with a hard shell and claws', 'desc_vi': 'Động vật biển có vỏ cứng và càng'},
    {'name': 'Jellyfish', 'img': 'assets/images/sea_animals/jellyfish.png', 'desc_en': 'A soft sea animal that stings', 'desc_vi': 'Động vật mềm sống dưới biển có thể chích'},
    {'name': 'Starfish', 'img': 'assets/images/sea_animals/starfish.png', 'desc_en': 'A sea animal shaped like a star', 'desc_vi': 'Động vật biển có hình ngôi sao'},
    {'name': 'Seahorse', 'img': 'assets/images/sea_animals/seahorse.png', 'desc_en': 'A small sea creature shaped like a horse', 'desc_vi': 'Sinh vật biển nhỏ hình con ngựa'},
    {'name': 'Clownfish', 'img': 'assets/images/sea_animals/clownfish.png', 'desc_en': 'A colorful fish from coral reefs', 'desc_vi': 'Cá nhiều màu sống trong rạn san hô'},
    {'name': 'Squid', 'img': 'assets/images/sea_animals/squid.png', 'desc_en': 'A sea animal similar to an octopus', 'desc_vi': 'Động vật biển giống bạch tuộc'},
    {'name': 'Coral', 'img': 'assets/images/sea_animals/coral.png', 'desc_en': 'A colorful sea creature that forms reefs', 'desc_vi': 'Sinh vật biển đầy màu sắc tạo thành rạn san hô'},
  ],

  "Vegetables": [
    {'name': 'Carrot', 'img': 'assets/images/vegetables/carrot.png', 'desc_en': 'An orange root vegetable', 'desc_vi': 'Củ cà rốt màu cam'},
    {'name': 'Tomato', 'img': 'assets/images/vegetables/tomato.png', 'desc_en': 'A red juicy vegetable', 'desc_vi': 'Cà chua đỏ mọng nước'},
    {'name': 'Papaya', 'img': 'assets/images/vegetables/papaya.png', 'desc_en': 'A sweet orange fruit', 'desc_vi': 'Đu đủ ngọt màu cam'},
    {'name': 'Broccoli', 'img': 'assets/images/vegetables/broccoli.png', 'desc_en': 'A green vegetable like a tree', 'desc_vi': 'Rau xanh như cây nhỏ'},
    {'name': 'Potato', 'img': 'assets/images/vegetables/potato.png', 'desc_en': 'A brown root vegetable', 'desc_vi': 'Củ màu nâu dùng làm khoai tây'},
    {'name': 'Onion', 'img': 'assets/images/vegetables/onion.png', 'desc_en': 'A vegetable that makes you cry', 'desc_vi': 'Loại rau khiến bạn chảy nước mắt'},
    {'name': 'Cucumber', 'img': 'assets/images/vegetables/cucumber.png', 'desc_en': 'A long green vegetable', 'desc_vi': 'Rau dài màu xanh, dưa leo'},
    {'name': 'Lettuce', 'img': 'assets/images/vegetables/lettuce.png', 'desc_en': 'A leafy green vegetable', 'desc_vi': 'Rau lá xanh thường dùng trong salad'},
    {'name': 'Corn', 'img': 'assets/images/vegetables/corn.png', 'desc_en': 'A yellow vegetable that grows on a cob', 'desc_vi': 'Rau màu vàng mọc trên bắp'},
    {'name': 'Eggplant', 'img': 'assets/images/vegetables/eggplant.png', 'desc_en': 'A purple vegetable also called aubergine', 'desc_vi': 'Rau tím còn gọi là cà tím'},
  ],


  "Body": [
    {'name': 'Foot', 'img': 'assets/images/body/foot.png', 'desc_en': 'Part of the leg used for walking', 'desc_vi': 'Phần chân dùng để đi'},
    {'name': 'Hand', 'img': 'assets/images/body/hand.png', 'desc_en': 'Used for holding and touching', 'desc_vi': 'Dùng để cầm và chạm'},
    {'name': 'Mouth', 'img': 'assets/images/body/mouth.png', 'desc_en': 'Used for eating and speaking', 'desc_vi': 'Dùng để ăn và nói'},
    {'name': 'Nose', 'img': 'assets/images/body/nose.png', 'desc_en': 'Used for smelling and breathing', 'desc_vi': 'Dùng để ngửi và thở'},
    {'name': 'Back', 'img': 'assets/images/body/theback.png', 'desc_en': 'The rear part of the body', 'desc_vi': 'Phần lưng cơ thể'},
    {'name': 'Belly', 'img': 'assets/images/body/thebelly.png', 'desc_en': 'The front part below the chest', 'desc_vi': 'Phần trước dưới ngực'},
    {'name': 'Head', 'img': 'assets/images/body/head.png', 'desc_en': 'Top part of the body containing the brain', 'desc_vi': 'Phần trên của cơ thể chứa não'},
    {'name': 'Eye', 'img': 'assets/images/body/eye.png', 'desc_en': 'Used for seeing', 'desc_vi': 'Dùng để nhìn'},
    {'name': 'Ear', 'img': 'assets/images/body/ear.png', 'desc_en': 'Used for hearing', 'desc_vi': 'Dùng để nghe'},
    {'name': 'Hair', 'img': 'assets/images/body/hair.png', 'desc_en': 'Grows on the head', 'desc_vi': 'Mọc trên đầu'},
    {'name': 'Arm', 'img': 'assets/images/body/arm.png', 'desc_en': 'Used to lift or hold things', 'desc_vi': 'Dùng để nâng hoặc giữ đồ vật'},
    {'name': 'Leg', 'img': 'assets/images/body/leg.png', 'desc_en': 'Used for walking or running', 'desc_vi': 'Dùng để đi hoặc chạy'},
    {'name': 'Neck', 'img': 'assets/images/body/neck.png', 'desc_en': 'Connects the head and body', 'desc_vi': 'Nối đầu với thân'},
    {'name': 'Shoulder', 'img': 'assets/images/body/shoulder.png', 'desc_en': 'Connects the arm to the body', 'desc_vi': 'Nối tay với thân'},
    {'name': 'Knee', 'img': 'assets/images/body/knee.png', 'desc_en': 'Middle joint of the leg', 'desc_vi': 'Khớp giữa của chân'},
    {'name': 'Elbow', 'img': 'assets/images/body/elbow.png', 'desc_en': 'Middle joint of the arm', 'desc_vi': 'Khớp giữa của tay'},
    {'name': 'Chest', 'img': 'assets/images/body/chest.png', 'desc_en': 'Front upper part of the body', 'desc_vi': 'Phần trước phía trên của cơ thể'},
    {'name': 'Heart', 'img': 'assets/images/body/heart.png', 'desc_en': 'Organ that pumps blood', 'desc_vi': 'Cơ quan bơm máu trong cơ thể'},
    {'name': 'Stomach', 'img': 'assets/images/body/stomach.png', 'desc_en': 'Organ that digests food', 'desc_vi': 'Cơ quan tiêu hóa thức ăn'},
    {'name': 'Finger', 'img': 'assets/images/body/finger.png', 'desc_en': 'Part of the hand used to touch things', 'desc_vi': 'Ngón tay dùng để chạm vào đồ vật'},
  ],


  "Colors": [
    {'name': 'Blue', 'img': 'assets/images/colors/blue.png', 'desc_en': 'The color of the sky', 'desc_vi': 'Màu của bầu trời'},
    {'name': 'Red', 'img': 'assets/images/colors/red.png', 'desc_en': 'The color of fire', 'desc_vi': 'Màu của lửa'},
    {'name': 'Pink', 'img': 'assets/images/colors/pink.png', 'desc_en': 'A light red color', 'desc_vi': 'Màu đỏ nhạt'},
    {'name': 'Yellow', 'img': 'assets/images/colors/yellow.png', 'desc_en': 'The color of the sun', 'desc_vi': 'Màu của mặt trời'},
    {'name': 'Purple', 'img': 'assets/images/colors/purple.png', 'desc_en': 'A mix of blue and red', 'desc_vi': 'Pha trộn giữa xanh và đỏ'},
    {'name': 'Green', 'img': 'assets/images/colors/green.png', 'desc_en': 'The color of grass', 'desc_vi': 'Màu của cỏ'},
    {'name': 'White', 'img': 'assets/images/colors/white.png', 'desc_en': 'The color of snow', 'desc_vi': 'Màu của tuyết'},
    {'name': 'Grey', 'img': 'assets/images/colors/grey.png', 'desc_en': 'A mix of black and white', 'desc_vi': 'Pha trộn giữa đen và trắng'},
    {'name': 'Black', 'img': 'assets/images/colors/black.png', 'desc_en': 'The color of darkness', 'desc_vi': 'Màu của bóng tối'},
    {'name': 'Orange', 'img': 'assets/images/colors/orange.png', 'desc_en': 'The color of oranges', 'desc_vi': 'Màu của quả cam'},
    {'name': 'Brown', 'img': 'assets/images/colors/brown.png', 'desc_en': 'The color of wood or chocolate', 'desc_vi': 'Màu của gỗ hoặc sô cô la'},
    {'name': 'Light Blue', 'img': 'assets/images/colors/light_blue.png', 'desc_en': 'A lighter shade of blue', 'desc_vi': 'Tông màu xanh dương nhạt'},
    {'name': 'Dark Blue', 'img': 'assets/images/colors/dark_blue.png', 'desc_en': 'A darker shade of blue', 'desc_vi': 'Tông màu xanh dương đậm'},
    {'name': 'Light Green', 'img': 'assets/images/colors/light_green.png', 'desc_en': 'A lighter shade of green', 'desc_vi': 'Tông màu xanh lá nhạt'},
    {'name': 'Dark Green', 'img': 'assets/images/colors/dark_green.png', 'desc_en': 'A darker shade of green', 'desc_vi': 'Tông màu xanh lá đậm'},
    {'name': 'Beige', 'img': 'assets/images/colors/beige.png', 'desc_en': 'A light brown color', 'desc_vi': 'Màu nâu nhạt'},
    {'name': 'Silver', 'img': 'assets/images/colors/silver.png', 'desc_en': 'The color of metal like silver', 'desc_vi': 'Màu của kim loại bạc'},
    {'name': 'Gold', 'img': 'assets/images/colors/gold.png', 'desc_en': 'The color of gold metal', 'desc_vi': 'Màu của vàng kim loại'},
    {'name': 'Violet', 'img': 'assets/images/colors/violet.png', 'desc_en': 'A soft purple color', 'desc_vi': 'Màu tím nhạt'},
    {'name': 'Magenta', 'img': 'assets/images/colors/magenta.png', 'desc_en': 'A deep pinkish-purple color', 'desc_vi': 'Màu tím hồng đậm'},
  ],

  "Fruits": [
    {'name': 'Apple', 'img': 'assets/images/fruits/apple.png', 'desc_en': 'A sweet red fruit', 'desc_vi': 'Trái táo đỏ ngọt'},
    {'name': 'Banana', 'img': 'assets/images/fruits/banana.png', 'desc_en': 'A long yellow fruit', 'desc_vi': 'Trái chuối dài màu vàng'},
    {'name': 'Watermelon', 'img': 'assets/images/fruits/watermelon.png', 'desc_en': 'A big green fruit with red inside', 'desc_vi': 'Quả lớn màu xanh, ruột đỏ'},
    {'name': 'Pineapple', 'img': 'assets/images/fruits/pineapple.png', 'desc_en': 'A tropical fruit with spikes', 'desc_vi': 'Trái cây nhiệt đới có gai'},
    {'name': 'Rambutan', 'img': 'assets/images/fruits/rambutan.png', 'desc_en': 'A hairy tropical fruit', 'desc_vi': 'Trái cây nhiệt đới có lông'},
    {'name': 'Mango', 'img': 'assets/images/fruits/mango.png', 'desc_en': 'A sweet tropical fruit with yellow flesh', 'desc_vi': 'Trái cây nhiệt đới ngọt với thịt vàng'},
    {'name': 'Orange', 'img': 'assets/images/fruits/orange.png', 'desc_en': 'A juicy fruit rich in vitamin C', 'desc_vi': 'Trái mọng nước giàu vitamin C'},
    {'name': 'Grapes', 'img': 'assets/images/fruits/grapes.png', 'desc_en': 'Small round fruit used to make wine', 'desc_vi': 'Trái nhỏ tròn dùng làm rượu vang'},
    {'name': 'Strawberry', 'img': 'assets/images/fruits/strawberry.png', 'desc_en': 'A red fruit with tiny seeds on its skin', 'desc_vi': 'Trái đỏ có hạt nhỏ trên vỏ'},
    {'name': 'Papaya', 'img': 'assets/images/fruits/papaya.png', 'desc_en': 'A sweet orange tropical fruit', 'desc_vi': 'Trái cây nhiệt đới ngọt màu cam'},
    {'name': 'Guava', 'img': 'assets/images/fruits/guava.png', 'desc_en': 'A green fruit with white or pink flesh', 'desc_vi': 'Trái màu xanh có ruột trắng hoặc hồng'},
    {'name': 'Lychee', 'img': 'assets/images/fruits/lychee.png', 'desc_en': 'A small tropical fruit with white flesh', 'desc_vi': 'Trái cây nhiệt đới nhỏ có ruột trắng'},
    {'name': 'Durian', 'img': 'assets/images/fruits/durian.png', 'desc_en': 'A spiky fruit with strong smell', 'desc_vi': 'Trái cây có gai và mùi mạnh'},
    {'name': 'Dragon Fruit', 'img': 'assets/images/fruits/dragon_fruit.png', 'desc_en': 'A pink fruit with white or red flesh and black seeds', 'desc_vi': 'Trái thanh long có ruột trắng hoặc đỏ với hạt đen'},
    {'name': 'Kiwi', 'img': 'assets/images/fruits/kiwi.png', 'desc_en': 'A brown fruit with green inside', 'desc_vi': 'Trái màu nâu, ruột xanh'},
    {'name': 'Cherry', 'img': 'assets/images/fruits/cherry.png', 'desc_en': 'A small round red fruit with a pit', 'desc_vi': 'Trái tròn nhỏ màu đỏ có hạt bên trong'},
    {'name': 'Pear', 'img': 'assets/images/fruits/pear.png', 'desc_en': 'A green or yellow sweet fruit', 'desc_vi': 'Trái ngọt màu xanh hoặc vàng'},
    {'name': 'Coconut', 'img': 'assets/images/fruits/coconut.png', 'desc_en': 'A tropical fruit with hard shell and water inside', 'desc_vi': 'Trái cây nhiệt đới có vỏ cứng và nước bên trong'},
    {'name': 'Avocado', 'img': 'assets/images/fruits/avocado.png', 'desc_en': 'A creamy green fruit rich in healthy fats', 'desc_vi': 'Trái cây màu xanh béo ngậy, giàu chất béo tốt'},
  ],

  // 🐄 Farm Animals
  "Farm Animals": [
    {'name': 'Cow', 'img': 'assets/images/farm_animals/cow.png', 'desc_en': 'A farm animal that gives milk', 'desc_vi': 'Con bò cho sữa'},
    {'name': 'Horse', 'img': 'assets/images/farm_animals/horse.png', 'desc_en': 'A fast animal used for riding', 'desc_vi': 'Con ngựa chạy nhanh dùng để cưỡi'},
    {'name': 'Sheep', 'img': 'assets/images/farm_animals/sheep.png', 'desc_en': 'A soft animal that gives wool', 'desc_vi': 'Con cừu cho len'},
    {'name': 'Pig', 'img': 'assets/images/farm_animals/pig.png', 'desc_en': 'A pink farm animal that likes mud', 'desc_vi': 'Con heo màu hồng thích bùn'},
    {'name': 'Duck', 'img': 'assets/images/farm_animals/duck.png', 'desc_en': 'A water bird that quacks', 'desc_vi': 'Chim nước kêu “quạc quạc”'},
    {'name': 'Goat', 'img': 'assets/images/farm_animals/goat.png', 'desc_en': 'A farm animal that eats grass and climbs', 'desc_vi': 'Con dê ăn cỏ và leo trèo'},
    {'name': 'Donkey', 'img': 'assets/images/farm_animals/donkey.png', 'desc_en': 'A strong animal used for carrying things', 'desc_vi': 'Con lừa khỏe dùng để chở đồ'},
    {'name': 'Turkey', 'img': 'assets/images/farm_animals/turkey.png', 'desc_en': 'A large bird often eaten at holidays', 'desc_vi': 'Chim gà tây lớn thường được ăn vào dịp lễ'},
    {'name': 'Rooster', 'img': 'assets/images/farm_animals/rooster.png', 'desc_en': 'A male chicken that crows in the morning', 'desc_vi': 'Gà trống gáy buổi sáng'},
    {'name': 'Goose', 'img': 'assets/images/farm_animals/goose.png', 'desc_en': 'A large bird that swims and honks', 'desc_vi': 'Chim ngỗng lớn biết bơi và kêu “két két”'},
    {'name': 'Rabbit', 'img': 'assets/images/farm_animals/rabbit.png', 'desc_en': 'A small animal with long ears', 'desc_vi': 'Con thỏ có tai dài'},
    {'name': 'Cat', 'img': 'assets/images/farm_animals/cat.png', 'desc_en': 'A small pet that catches mice', 'desc_vi': 'Con mèo nhỏ bắt chuột'},
    {'name': 'Dog', 'img': 'assets/images/farm_animals/dog.png', 'desc_en': 'A loyal pet that guards the farm', 'desc_vi': 'Con chó trung thành canh giữ trang trại'},
  ],


  // 🌸 Flowers
  "Flowers": [
    {'name': 'Rose', 'img': 'assets/images/flowers/rose.png', 'desc_en': 'A red flower symbolizing love', 'desc_vi': 'Hoa hồng đỏ tượng trưng cho tình yêu'},
    {'name': 'Tulip', 'img': 'assets/images/flowers/tulip.png', 'desc_en': 'A colorful spring flower', 'desc_vi': 'Hoa tulip rực rỡ vào mùa xuân'},
    {'name': 'Sunflower', 'img': 'assets/images/flowers/sunflower.png', 'desc_en': 'A tall yellow flower that follows the sun', 'desc_vi': 'Hoa hướng dương vàng cao theo hướng mặt trời'},
    {'name': 'Lily', 'img': 'assets/images/flowers/lily.png', 'desc_en': 'A white flower symbolizing purity', 'desc_vi': 'Hoa loa kèn trắng tượng trưng cho sự thuần khiết'},
    {'name': 'Daisy', 'img': 'assets/images/flowers/daisy.png', 'desc_en': 'A small white flower with a yellow center', 'desc_vi': 'Hoa cúc nhỏ màu trắng có nhụy vàng'},
    {'name': 'Lotus', 'img': 'assets/images/flowers/lotus.png', 'desc_en': 'A pink flower that grows in water', 'desc_vi': 'Hoa sen hồng mọc trong nước'},
    {'name': 'Orchid', 'img': 'assets/images/flowers/orchid.png', 'desc_en': 'An elegant flower in many colors', 'desc_vi': 'Hoa lan thanh lịch với nhiều màu sắc'},
    {'name': 'Lavender', 'img': 'assets/images/flowers/lavender.png', 'desc_en': 'A purple flower with a calming scent', 'desc_vi': 'Hoa oải hương tím có mùi thơm dịu'},
    {'name': 'Cherry Blossom', 'img': 'assets/images/flowers/cherry_blossom.png', 'desc_en': 'A pink spring flower from Japan', 'desc_vi': 'Hoa anh đào hồng của Nhật Bản'},
    {'name': 'Peony', 'img': 'assets/images/flowers/peony.png', 'desc_en': 'A large colorful flower symbolizing prosperity', 'desc_vi': 'Hoa mẫu đơn lớn rực rỡ biểu trưng cho thịnh vượng'},
    {'name': 'Marigold', 'img': 'assets/images/flowers/marigold.png', 'desc_en': 'A bright orange-yellow flower', 'desc_vi': 'Hoa vạn thọ màu vàng cam rực rỡ'},
  ],



  // ==========================
  // 🔹 JOBS - Nghề nghiệp
  // ==========================
  "Jobs": [
    {"name": "Doctor", 'img': 'assets/images/jobs/doctor.png', "desc_en": "A person who treats sick people", "desc_vi": "Bác sĩ chữa bệnh cho người khác", "example_en": "The doctor helped me recover quickly.", "example_vi": "Bác sĩ giúp tôi hồi phục nhanh chóng."},
    {"name": "Teacher", 'img': 'assets/images/jobs/teacher.png', "desc_en": "A person who teaches students", "desc_vi": "Người dạy học sinh", "example_en": "The teacher explains the lesson clearly.", "example_vi": "Giáo viên giải thích bài rất rõ ràng."},
    {"name": "Chef", 'img': 'assets/images/jobs/chef.png', "desc_en": "A person who cooks food in a restaurant", "desc_vi": "Đầu bếp nấu ăn trong nhà hàng", "example_en": "The chef made a delicious cake.", "example_vi": "Đầu bếp làm chiếc bánh rất ngon."},
    {"name": "Engineer", 'img': 'assets/images/jobs/engineer.png', "desc_en": "A person who designs and builds things", "desc_vi": "Kỹ sư thiết kế và xây dựng công trình", "example_en": "My brother is an engineer.", "example_vi": "Anh trai tôi là kỹ sư."},
    {"name": "Farmer", 'img': 'assets/images/jobs/farmer.png', "desc_en": "A person who works on a farm", "desc_vi": "Người làm việc trên nông trại", "example_en": "The farmer grows rice every year.", "example_vi": "Người nông dân trồng lúa mỗi năm."},
    {"name": "Police Officer", 'img': 'assets/images/jobs/policeofficer.png', "desc_en": "A person who protects people and keeps order", "desc_vi": "Cảnh sát bảo vệ người dân và giữ trật tự", "example_en": "The police officer caught the thief.", "example_vi": "Cảnh sát bắt được tên trộm."},
    {"name": "Firefighter", 'img': 'assets/images/jobs/firefighter.png', "desc_en": "A person who puts out fires", "desc_vi": "Người dập tắt đám cháy", "example_en": "The firefighter saved the cat from the fire.", "example_vi": "Lính cứu hỏa cứu con mèo khỏi đám cháy."},
    {"name": "Pilot", 'img': 'assets/images/jobs/pilot.png', "desc_en": "A person who flies airplanes", "desc_vi": "Phi công lái máy bay", "example_en": "The pilot flies the plane safely.", "example_vi": "Phi công lái máy bay an toàn."},
    {"name": "Nurse", 'img': 'assets/images/jobs/nurse.png', "desc_en": "A person who helps doctors take care of patients", "desc_vi": "Y tá giúp bác sĩ chăm sóc bệnh nhân", "example_en": "The nurse gave me medicine.", "example_vi": "Y tá đưa thuốc cho tôi."},
    {"name": "Artist", 'img': 'assets/images/jobs/artist.png', "desc_en": "A person who creates art", "desc_vi": "Người sáng tạo nghệ thuật", "example_en": "The artist painted a beautiful picture.", "example_vi": "Họa sĩ vẽ một bức tranh tuyệt đẹp."},
  ],

  // ==========================
  // 🔹 WEATHER - Thời tiết
  // ==========================
  "Weather": [
    {"name": "Sunny", 'img': 'assets/images/weather/sunny.png', "desc_en": "When the sun is shining", "desc_vi": "Trời có nắng", "example_en": "It’s a sunny day today.", "example_vi": "Hôm nay là một ngày nắng đẹp."},
    {"name": "Rainy", 'img': 'assets/images/weather/rainy.png', "desc_en": "When it rains", "desc_vi": "Trời mưa", "example_en": "I love rainy days.", "example_vi": "Tôi thích những ngày mưa."},
    {"name": "Cloudy", 'img': 'assets/images/weather/cloudy.png', "desc_en": "When there are many clouds", "desc_vi": "Trời nhiều mây", "example_en": "The sky is cloudy.", "example_vi": "Bầu trời nhiều mây."},
    {"name": "Windy", 'img': 'assets/images/weather/windy.png', "desc_en": "When there is a lot of wind", "desc_vi": "Trời có nhiều gió", "example_en": "It’s very windy outside.", "example_vi": "Bên ngoài rất nhiều gió."},
    {"name": "Stormy", 'img': 'assets/images/weather/stormy.png', "desc_en": "With heavy rain and thunder", "desc_vi": "Có mưa to và sấm sét", "example_en": "We stayed inside during the storm.", "example_vi": "Chúng tôi ở trong nhà khi có bão."},
    {"name": "Snowy", 'img': 'assets/images/weather/snowy.png', "desc_en": "When snow falls", "desc_vi": "Trời có tuyết rơi", "example_en": "The mountains are snowy in winter.", "example_vi": "Núi phủ đầy tuyết vào mùa đông."},
    {"name": "Foggy", 'img': 'assets/images/weather/foggy.png', "desc_en": "When there is a lot of fog", "desc_vi": "Trời có nhiều sương mù", "example_en": "The road is foggy this morning.", "example_vi": "Sáng nay đường có nhiều sương mù."},
    {"name": "Hot", 'img': 'assets/images/weather/hot.png', "desc_en": "When the temperature is high", "desc_vi": "Trời nóng", "example_en": "It’s too hot to go outside.", "example_vi": "Trời quá nóng để ra ngoài."},
    {"name": "Cold", 'img': 'assets/images/weather/cold.png', "desc_en": "When the temperature is low", "desc_vi": "Trời lạnh", "example_en": "It’s cold in December.", "example_vi": "Tháng 12 trời rất lạnh."},
    {"name": "Rainbow", 'img': 'assets/images/weather/rainbow.png', "desc_en": "Colors in the sky after rain", "desc_vi": "Cầu vồng sau cơn mưa", "example_en": "We saw a rainbow after the rain.", "example_vi": "Chúng tôi thấy cầu vồng sau cơn mưa."},
  ],

  // ==========================
  // 🔹 SCHOOL SUPPLIES - Dụng cụ học tập
  // ==========================
  "School Supplies": [
    {"name": "Pencil", 'img': 'assets/images/schoolsupplies/pencil.png', "desc_en": "Used for writing", "desc_vi": "Dùng để viết", "example_en": "I need a new pencil.", "example_vi": "Tôi cần một cây bút chì mới."},
    {"name": "Pen", 'img': 'assets/images/schoolsupplies/ben.png', "desc_en": "Used for writing in ink", "desc_vi": "Bút mực", "example_en": "She wrote a letter with a blue pen.", "example_vi": "Cô ấy viết thư bằng bút mực xanh."},
    {"name": "Notebook", 'img': 'assets/images/schoolsupplies/notebook.png', "desc_en": "Book for writing notes", "desc_vi": "Quyển vở để ghi chép", "example_en": "I write my homework in a notebook.", "example_vi": "Tôi viết bài tập vào vở."},
    {"name": "Eraser", 'img': 'assets/images/schoolsupplies/eraser.png', "desc_en": "Used to remove pencil marks", "desc_vi": "Dùng để tẩy xóa", "example_en": "Use an eraser to fix your mistake.", "example_vi": "Dùng tẩy để sửa lỗi sai."},
    {"name": "Ruler", 'img': 'assets/images/schoolsupplies/ruler.png', "desc_en": "Used to draw straight lines", "desc_vi": "Dụng cụ kẻ thẳng", "example_en": "Measure it with a ruler.", "example_vi": "Đo bằng thước kẻ đi."},
    {"name": "Scissors", 'img': 'assets/images/schoolsupplies/scissors.png', "desc_en": "Used for cutting paper", "desc_vi": "Cắt giấy", "example_en": "Be careful when using scissors.", "example_vi": "Hãy cẩn thận khi dùng kéo."},
    {"name": "Bag", 'img': 'assets/images/schoolsupplies/pag.png', "desc_en": "Used to carry books", "desc_vi": "Dùng để đựng sách vở", "example_en": "I put my books in the bag.", "example_vi": "Tôi để sách vào cặp."},
    {"name": "Sharpener", 'img': 'assets/images/schoolsupplies/sharpener.png', "desc_en": "Used to sharpen pencils", "desc_vi": "Dụng cụ gọt bút chì", "example_en": "My pencil sharpener is broken.", "example_vi": "Cái gọt bút chì của tôi bị hỏng."},
    {"name": "Crayons", 'img': 'assets/images/schoolsupplies/crayons.png', "desc_en": "Colored sticks for drawing", "desc_vi": "Bút sáp màu", "example_en": "The kids love drawing with crayons.", "example_vi": "Bọn trẻ thích vẽ bằng sáp màu."},
    {"name": "Calculator", 'img': 'assets/images/schoolsupplies/calculator.png', "desc_en": "Used for math", "desc_vi": "Máy tính bỏ túi", "example_en": "Use a calculator to solve this problem.", "example_vi": "Dùng máy tính để giải bài này."},
  ],

  // ==========================
  // 🔹 TRANSPORT - Giao thông
  // ==========================
  "Transport": [
    {"name": "Car", 'img': 'assets/images/transport/car.png', "desc_en": "A road vehicle with four wheels", "desc_vi": "Xe ô tô", "example_en": "My father drives a car to work.", "example_vi": "Ba tôi lái xe đến chỗ làm."},
    {"name": "Bus", 'img': 'assets/images/transport/bus.png', "desc_en": "Large vehicle for many passengers", "desc_vi": "Xe buýt", "example_en": "We go to school by bus.", "example_vi": "Chúng tôi đi học bằng xe buýt."},
    {"name": "Bicycle", 'img': 'assets/images/transport/bicycle.png', "desc_en": "A vehicle with two wheels", "desc_vi": "Xe đạp", "example_en": "I ride my bicycle every morning.", "example_vi": "Tôi đi xe đạp mỗi sáng."},
    {"name": "Motorbike", 'img': 'assets/images/transport/motorbike.png', "desc_en": "A two-wheeled motor vehicle", "desc_vi": "Xe máy", "example_en": "He goes to work by motorbike.", "example_vi": "Anh ấy đi làm bằng xe máy."},
    {"name": "Airplane", 'img': 'assets/images/transport/airplane.png', "desc_en": "A flying vehicle", "desc_vi": "Máy bay", "example_en": "The airplane is landing.", "example_vi": "Máy bay đang hạ cánh."},
    {"name": "Boat", 'img': 'assets/images/transport/boat.png', "desc_en": "Used on water", "desc_vi": "Thuyền", "example_en": "We took a boat trip on the river.", "example_vi": "Chúng tôi đi thuyền trên sông."},
    {"name": "Train", 'img': 'assets/images/transport/train.png', "desc_en": "Runs on tracks", "desc_vi": "Tàu hỏa", "example_en": "The train is very fast.", "example_vi": "Tàu hỏa chạy rất nhanh."},
    {"name": "Taxi", 'img': 'assets/images/transport/taxi.png', "desc_en": "A car you pay to ride in", "desc_vi": "Xe taxi", "example_en": "We took a taxi to the hotel.", "example_vi": "Chúng tôi bắt taxi đến khách sạn."},
    {"name": "Helicopter", 'img': 'assets/images/transport/helicopter.png', "desc_en": "A flying vehicle with blades", "desc_vi": "Trực thăng", "example_en": "The helicopter flies over the city.", "example_vi": "Trực thăng bay trên thành phố."},
    {"name": "Subway", 'img': 'assets/images/transport/subway.png', "desc_en": "An underground train", "desc_vi": "Tàu điện ngầm", "example_en": "He takes the subway to work.", "example_vi": "Anh ấy đi làm bằng tàu điện ngầm."},
  ],

  // ==========================
  // 🔹 EMOTIONS - Cảm xúc
  // ==========================
  "Emotions": [
    {"name": "Happy", 'img': 'assets/images/emotions/happy.png', "desc_en": "Feeling joy", "desc_vi": "Vui vẻ", "example_en": "I feel happy today.", "example_vi": "Hôm nay tôi cảm thấy vui."},
    {"name": "Sad", 'img': 'assets/images/emotions/sad.png', "desc_en": "Feeling unhappy", "desc_vi": "Buồn bã", "example_en": "She was sad after the movie.", "example_vi": "Cô ấy buồn sau khi xem phim."},
    {"name": "Angry", 'img': 'assets/images/emotions/angry.png', "desc_en": "Feeling mad", "desc_vi": "Tức giận", "example_en": "He was angry about the mistake.", "example_vi": "Anh ấy tức giận vì lỗi đó."},
    {"name": "Surprised", 'img': 'assets/images/emotions/surprised.png', "desc_en": "Feeling amazed", "desc_vi": "Ngạc nhiên", "example_en": "I was surprised by the gift.", "example_vi": "Tôi ngạc nhiên vì món quà."},
    {"name": "Scared", 'img': 'assets/images/emotions/scared.png', "desc_en": "Feeling afraid", "desc_vi": "Sợ hãi", "example_en": "The child was scared of the dark.", "example_vi": "Đứa bé sợ bóng tối."},
    {"name": "Tired", 'img': 'assets/images/emotions/tired.png', "desc_en": "Needing rest", "desc_vi": "Mệt mỏi", "example_en": "I feel tired after work.", "example_vi": "Tôi cảm thấy mệt sau khi làm việc."},
    {"name": "Excited", 'img': 'assets/images/emotions/excited.png', "desc_en": "Feeling very happy", "desc_vi": "Hào hứng", "example_en": "The kids are excited for the trip.", "example_vi": "Bọn trẻ háo hức cho chuyến đi."},
    {"name": "Bored", 'img': 'assets/images/emotions/bored.png', "desc_en": "Feeling uninterested", "desc_vi": "Chán nản", "example_en": "I'm bored with this movie.", "example_vi": "Tôi thấy chán bộ phim này."},
    {"name": "Confused", 'img': 'assets/images/emotions/confused.png', "desc_en": "Not understanding", "desc_vi": "Bối rối", "example_en": "He looked confused about the question.", "example_vi": "Anh ấy có vẻ bối rối trước câu hỏi."},
    {"name": "Proud", 'img': 'assets/images/emotions/proud.png', "desc_en": "Feeling good about success", "desc_vi": "Tự hào", "example_en": "I'm proud of my achievement.", "example_vi": "Tôi tự hào về thành tích của mình."},
  ],
};

/// 🆕 Danh sách các chủ đề mới nhất (tối đa 5)
List<String> newTopicNames = [
  "Fruits",
  "Colors",
  "Animals",
  "Body",
  "Alphabet",
];

/// 🧩 Hàm thêm chủ đề mới và tự động cập nhật danh sách "New"
void addNewTopic(String topicName, List<Map<String, String>> data) {
  topicData[topicName] = data;
  newTopicNames.insert(0, topicName);
  if (newTopicNames.length > 5) {
    newTopicNames = newTopicNames.sublist(0, 5);
  }
}
