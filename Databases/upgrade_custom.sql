/*
 * Clean up section
 * The queries performed in the section will remove depreciated tables and columns
 */

ALTER TABLE `openrsc_equipped` CHANGE IF EXISTS `id` `itemID` int(10) UNSIGNED NOT NULL;
ALTER TABLE `openrsc_equipped` DROP COLUMN IF EXISTS `amount`;
ALTER TABLE `openrsc_equipped` DROP COLUMN IF EXISTS `dbid`;


/*
 * Itemdef additions
 *  Adds custom items to the itemdef table
 */

REPLACE INTO `openrsc_itemdef` (`id`, `name`, `description`, `command`, `isFemaleOnly`,
                               `isMembersOnly`, `isStackable`, `isUntradable`, `isWearable`, `appearanceID`,
                               `wearableID`, `wearSlot`, `requiredLevel`, `requiredSkillID`, `armourBonus`,
                               `weaponAimBonus`, `weaponPowerBonus`, `magicBonus`, `prayerBonus`, `basePrice`, `isNoteable`)
VALUES (1290, 'Ironman helm', 'For just a rather very independent scaper.', '', 0, 0, 0, 1, 1, 318, 33, 0, 1, 1,
        6, 0, 0, 0, 0, 154, 1),
       (1291, 'Ironman platebody', 'Take it off and what are you?', '', 0, 0, 0, 1, 1, 319, 322, 1, 1, 1, 20, 0,
        0, 0, 0, 560, 1),
       (1292, 'Ironman platelegs', 'Take it off and what are you?', '', 0, 0, 0, 1, 1, 320, 644, 2, 1, 1, 10, 0,
        0, 0, 0, 280, 1),
       (1293, 'Ultimate ironman helm', 'For Just A Rather Very Independent Scaper.', '', 0, 0, 0, 1, 1, 321, 33,
        0, 1, 1, 6, 0, 0, 0, 0, 154, 1),
       (1294, 'Ultimate ironman platebody', 'Take it off and what are you?', '', 0, 0, 0, 1, 1, 322, 322, 1, 1,
        1, 20, 0, 0, 0, 0, 560, 1),
       (1295, 'Ultimate ironman platelegs', 'Take it off and what are you?', '', 0, 0, 0, 1, 1, 323, 644, 2, 1,
        1, 10, 0, 0, 0, 0, 280, 1),
       (1296, 'Hardcore ironman helm', 'For those who stand alone.', '', 0, 0, 0, 1, 1, 324, 33, 0, 1, 1, 6, 0,
        0, 0, 0, 154, 1),
       (1297, 'Hardcore ironman platebody', 'Take it off and what are you?', '', 0, 0, 0, 1, 1, 325, 322, 1, 1,
        1, 20, 0, 0, 0, 0, 560, 1),
       (1298, 'Hardcore ironman platelegs', 'Take it off and what are you?', '', 0, 0, 0, 1, 1, 326, 644, 2, 1,
        1, 10, 0, 0, 0, 0, 280, 1),
       (1299, 'Rune essence', 'An uncharged runestone', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1300, 'Air talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1301, 'Mind talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1302, 'Water talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1303, 'Earth talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1304, 'Fire talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1305, 'Body talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1306, 'Cosmic talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1307, 'Chaos talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1308, 'Nature talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1309, 'Law talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1310, 'Death talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1311, 'Blood talisman', 'A mysterious power emanates from this talisman...', 'Locate', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1312, 'Research package', 'This contains some vital research results. bank for the equivalent item.',
        '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
       (1313, 'Research notes', 'These make no sense at all.', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0),
       (1314, 'Ring of recoil', 'An uncharged ring.', 'Check,Break', 0, 1, 0, 0, 1, 0, 1200, 13, 0, 0, 0, 0,
        0, 0, 0, 900, 1),
       (1315, 'Ring of splendor', 'An uncharged ring.', '', 0, 1, 0, 0, 1, 0, 1200, 13, 0, 0, 0, 0, 0, 0, 0,
        1275, 1),
       (1316, 'Ring of forging', 'An uncharged ring.', 'Check,Break', 0, 1, 0, 0, 1, 0, 1200, 13, 0, 0, 0, 0,
        0, 0, 0, 2025, 1),
       (1317, 'Ring of life', 'An uncharged ring.', '', 0, 1, 0, 0, 1, 0, 1200, 13, 0, 0, 0, 0, 0, 0, 0,
        3525, 1),
       (1318, 'Ring of wealth', 'An uncharged ring.', '', 0, 1, 0, 0, 1, 0, 1200, 13, 0, 0, 0, 0, 0, 0, 0,
        17625, 1),
       (1319, 'Ring of avarice', 'An uncharged ring.', '', 0, 1, 0, 0, 1, 0, 1200, 13, 0, 0, 0, 0, 0, 0, 0,
        17625, 1),
       (1320, 'Dwarven ring', 'An uncharged ring.', 'Check,Break', 0, 1, 0, 0, 1, 0, 1200, 13, 0, 0, 0, 0, 0,
        0, 0, 400, 1),
       (1321, 'Opal ring', 'A valuable ring', '', 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 1050, 1),
       (1322, 'White wolf mask', 'Awooo', '', 0, 0, 0, 0, 1, 291, 32, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1323, 'Blood wolf mask', 'Awooo', '', 0, 0, 0, 0, 1, 292, 32, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1324, 'Black wolf mask', 'Awooo', '', 0, 0, 0, 0, 1, 293, 32, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1325, 'Pink wolf mask', 'Awooo', '', 0, 0, 0, 0, 1, 294, 32, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1326, 'White unicorn mask', 'Im so fluffy Im gonne die!!', '', 0, 0, 0, 0, 1, 287, 32, 5, 0, 0, 0, 0,
        0, 0, 0, 0, 1),
       (1327, 'Blood unicorn mask', 'Im so fluffy Im gonne die!!', '', 0, 0, 0, 0, 1, 288, 32, 5, 0, 0, 0, 0,
        0, 0, 0, 0, 1),
       (1328, 'Black unicorn mask', 'Im so fluffy Im gonne die!!', '', 0, 0, 0, 0, 1, 289, 32, 5, 0, 0, 0, 0,
        0, 0, 0, 0, 1),
       (1329, 'Pink unicorn mask', 'Im so fluffy Im gonne die!!', '', 0, 0, 0, 0, 1, 290, 32, 5, 0, 0, 0, 0,
        0, 0, 0, 0, 1),
       (1330, 'Trick or treat cracker', 'Use on another player to pull it', '', 0, 0, 0, 0, 0, 0, 0, -1, 0,
        -1, 0, 0, 0, 0, 0, 1, 1),
       (1331, 'Fox mask', 'Struttin like a fox', '', 0, 0, 0, 0, 1, 387, 32, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1),
       (1332, 'Christmas cape', 'A cape worn on the holidays', '', 0, 0, 0, 0, 1, 395, 2048, 11, 1, 1, 0, 0, 0, 0, 0, 3, 1),
       (1333, 'Santa\'s hat with beard', 'It\'s a santa claus\' hat with a beard!', '', 0, 0, 0, 0, 1, 398, 32, 5, 1, 1, 0, 0, 0, 0, 0, 160, 1),
       (1334, 'Christmas Apron', 'An apron for the festivities', '', 0, 0, 0, 0, 1, 394, 1024, 8, 1, 1, 0, 0, 0, 0, 0, 2, 1),
       (1335, 'Glass of milk', 'A glass of tasty milk', 'drink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1336, 'Cane cookie', 'A tasty holiday cookie', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1337, 'Star cookie', 'A tasty holiday cookie', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1338, 'Tree cookie', 'A tasty holiday cookie', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1339, 'Santa\'s Gloves', 'These keep Santa\'s hands warm', '', 0, 0, 0, 0, 1, 400, 256, 10, 1, 1, 0, 0,
        0, 0, 0, 6, 1),
       (1340, 'Santa\'s Mittens', 'Santa\'s favorite mittens', '', 0, 0, 0, 0, 1, 399, 256, 10, 1, 1, 0, 0,
        0, 0, 0, 6, 1),
       (1341, 'Santa\'s suit', 'A suit full of joy', '', 0, 0, 0, 0, 1, 396, 64, 6, 1, 1, 0, 0,
        0, 0, 0, 8, 1),
       (1342, 'Santa\'s suit', 'A suit full of joy', '', 0, 0, 0, 0, 1, 397, 644, 2, 1, 1, 0, 0,
        0, 0, 0, 8, 1),
       (1343, 'Santa\'s hat', 'It\'s a santa claus\' hat', '', 0, 0, 0, 0, 1, 401, 32, 5, 1, 1, 0, 0, 0, 0, 0, 160, 1),
       (1344, 'Antlers with red-nose', 'Im Rudolph the reindeer!!!', '', 0, 0, 0, 0, 1, 402, 32, 5, 1, 1, 0, 0, 0, 0, 0, 3, 1),
       (1345, 'Beverage glass', 'A glass left after a tasty drink', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
       (1346, 'dragon 2-handed Sword', 'A massive sword', '', 0, 0, 0, 0, 1, 403, 8216, 4, 60, 0, 0, 99, 99, 0, 0, 5000000, 1),
       (1347, 'King Black Dragon scale', 'Taken from a monstrous beast', '', 0, 1, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 2500, 1),
       (1348, 'red apple', 'Seems tasty!', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
       (1349, 'grapefruit', 'It\'s very fresh', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1350, 'papaya', 'Seems very tasty!', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1351, 'coconut', 'It can be cut up with a machette', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1352, 'Red Cabbage', 'Yuck I don\'t like cabbage', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
       (1353, 'Corn', 'Some fresh picked corn', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1354, 'White Pumpkin', 'Wonder how it tastes', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1355, 'Fruit Picker', 'Useful for picking trees better', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1),
       (1356, 'Hand Shovel', 'This will help get yield from bushes and allotments', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 1),
       (1357, 'Herb Clippers', 'Useful for picking up herbs out there', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 1),
       (1358, 'Watering Can', 'It\'s a watering can', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 1),
       (1359, 'grapefruit slices', 'It\'s very fresh', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1360, 'Diced grapefruit', 'Fresh chunks of grapefruit', 'eat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1361, 'Half coconut', 'Looks like some great coconut', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
       (1362, 'Teddy Body', 'A fluffy teddy body', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0),
       (1363, 'Teddy Head', 'A fluffy teddy head', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0),
       (1364, 'Teddy', 'A fluffy teddy', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0),
       (1365, 'Dragon bar', 'it\'s a bar of dragon metal', '', 0, 1, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 100000, 1),
       (1366, 'Chipped Dragon Scale', 'a piece of dragon scale', '', 0, 1, 1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 500, 0),
       (1367, 'Dragon Metal Chain', 'a loop of dragon metal', '', 0, 1, 1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 1000, 0),
       (1368, 'Dragon Scale Mail', 'a dragon chain mail reinforced with dragon scales', '', 0, 0, 0, 0, 1, 404, 64, 6, 60, 1,
        95, 10, 6, 0, 0, 1500000, 1),
       (1369, 'Dwarf Smithy Note', 'Details how to make the Dragon Scale Mail', 'read', 0, 1, 0, 1, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 1, 0),
       (1370, 'Leather chaps', 'They seem like decent protection', '', 0, 0, 0, 0, 1, 426, 644, 2, 1, 1, 4, 0, 0, 0, 0, 14, 1),
       (1371, 'Leather top', 'A stylish leather top', '', 1, 0, 0, 0, 1, 427, 322, 1, 1, 1, 10, 0, 0, 0, 0, 21, 1),
       (1372, 'Leather skirt', 'A ladies skirt made of leather', '', 0, 0, 0, 0, 1, 428, 128, 7, 1, 1, 3, 0, 0, 0, 0, 14, 1),
       (1373, 'Cooking cape', 'The cape worn by the world\'s best chefs', '', 0, 0, 0, 1, 1, 311, 2048, 11, 99,
        7, 6, 0, 0, 0, 0, 99000, 0),
       (1374, 'Attack cape', 'The cape worn by masters of attack', '', 0, 0, 0, 1, 1, 315, 2048, 11, 99, 0, 6, 0,
        0, 0, 0, 99000, 0),
       (1375, 'Thieving cape', 'The cape worn by masters of thieving', '', 0, 0, 0, 1, 1, 429, 2048, 11, 99, 17, 6, 0, 0, 0, 0, 99000, 0),
       (1376, 'Fletching cape', 'The cape worn by masters of fletching', '', 0, 0, 0, 1, 1, 430, 2048, 11, 99, 9, 6, 0, 0, 0, 0, 99000, 0),
       (1377, 'Mining cape', 'The cape worn by masters of mining', '', 0, 0, 0, 1, 1, 431, 2048, 11, 99, 14, 6, 0, 0, 0, 0, 99000, 0),
	   (1378, 'Pestilence Mask', 'You wouldn\'t want to be seen in this! Stay the cabbage home!', '', 0, 0, 0, 0, 1, 432, 32, 5, 1, 1, 0, 0, 0, 0, 0, 0, 1),
	   (1379, 'Rubber Chicken Cap', 'Wow. That was some very in-depth research on the chicken or the egg question.', '', 0, 0, 0, 0, 1, 433, 32, 5, 1, 1, 0, 0, 0, 0, 0, 0, 1);

