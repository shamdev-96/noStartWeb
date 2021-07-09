'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "f33c176279a8ba6127ced1a6ac44b04e",
"index.html": "33c57bc95548ca3b855ba43968976389",
"/": "33c57bc95548ca3b855ba43968976389",
"main.dart.js": "d9ab52e6fafe7ce5ec9b04ccc75205db",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "409cdea9b9a27b90e618059e80c1aa57",
"assets/images/gameBackground.jpg": "57cab492907cfd8806307c44299161e7",
"assets/images/board_snake.png": "01f40a6ba4e2299992e8c870a6b0b6f0",
"assets/images/kotak/kotak_67.png": "cb5b96222a538b072f86cf5052223c50",
"assets/images/kotak/kotak_73.png": "de94feb155f6de6b97150551fc3bc970",
"assets/images/kotak/kotak_98.png": "b7a502bf8897583be33a3cd6132a790e",
"assets/images/kotak/kotak_2.png": "accd6326c5301938c30da8ff8cfe7a91",
"assets/images/kotak/kotak_3.png": "dbc5e83cc26ad4ad498ee29519adf6d5",
"assets/images/kotak/kotak_99.png": "07eeb870b9a6071fd2cbc0844e46a035",
"assets/images/kotak/kotak_72.png": "10d9810b986f7e54d551c434ebd271bb",
"assets/images/kotak/kotak_66.png": "bbf5ad996e34e0565a52c085373f5548",
"assets/images/kotak/kotak_70.png": "12d5cb212e2f595971d0489e064ddb61",
"assets/images/kotak/kotak_64.png": "c9aaafa8daf1e6e19fe6d0f0ac20644d",
"assets/images/kotak/kotak_58.png": "a5ff8033ba4f88db0afd2c0d885696a0",
"assets/images/kotak/kotak_1.png": "65b65b40f8c844cf2981f9d34c99c9cf",
"assets/images/kotak/kotak_59.png": "a00b5fac8379d4ef1d3d2c56898bc3f3",
"assets/images/kotak/kotak_65.png": "3f93e4d87b14396c8dd980f9e5c4aa25",
"assets/images/kotak/kotak_71.png": "61fb50db1cff9d9d11fdd75e45e2360b",
"assets/images/kotak/kotak_49.png": "dae3e17f70be3cc54de2d0b809854b69",
"assets/images/kotak/kotak_75.png": "523c04e5ec2f99926196a7e3a70ba84e",
"assets/images/kotak/kotak_61.png": "31c9ba05043d6aad5e54c1014eec3900",
"assets/images/kotak/kotak_4.png": "9ddb0834935b434e8d28d46dda8ebd66",
"assets/images/kotak/kotak_5.png": "bf00a65d9da827483259e179721e4e88",
"assets/images/kotak/kotak_60.png": "2cbc49f2fdf30b7bbc1431a156aa7a67",
"assets/images/kotak/kotak_74.png": "d46283c29a9fda3e23368eb540463bae",
"assets/images/kotak/kotak_48.png": "9e28407a5768297d97c632427fa6aa99",
"assets/images/kotak/kotak_62.png": "ae38e581ae9791c7a66d3f517641b688",
"assets/images/kotak/kotak_76.png": "b6147ea5caeb535137115d873c25af28",
"assets/images/kotak/kotak_89.png": "c086f43f8413f6b33e461579a835ab8e",
"assets/images/kotak/kotak_7.png": "0c7d06ffed4b31ce21e97a4ded527ae6",
"assets/images/kotak/kotak_6.png": "27d35821539f9ecc743dee8f8e70239e",
"assets/images/kotak/kotak_88.png": "1519c18bbfa6b6cf4b5d823944445733",
"assets/images/kotak/kotak_77.png": "0e7379d50961bc5fb54dbb5bedff5375",
"assets/images/kotak/kotak_63.png": "4b2b11f3477aca766dcf332df2fa3571",
"assets/images/kotak/kotak_10.png": "d765a1b5a845c077fdae3fafed0d82f7",
"assets/images/kotak/kotak_38.png": "6eb3b97ef5c7b4bf744f9076d3daa384",
"assets/images/kotak/kotak_39.png": "0e47f4348c45d2264aeae6916974b1d6",
"assets/images/kotak/kotak_11.png": "b82eaa657176ba504059159641bdbb4f",
"assets/images/kotak/kotak_13.png": "dac92400335ec756814a6078741fb929",
"assets/images/kotak/kotak_12.png": "44919b97a8f432aa13c1a8d2c77a05be",
"assets/images/kotak/kotak_16.png": "f06259b5b656a3535f31010dc96aba89",
"assets/images/kotak/kotak_17.png": "9a859a9518740664b0d3f4cf021850bf",
"assets/images/kotak/kotak_29.png": "d4be31353f72e2cd5583c50618a5ecab",
"assets/images/kotak/kotak_15.png": "cf59b7a50c7314645800f28ae882f740",
"assets/images/kotak/kotak_14.png": "a7f5eca780e0cb26ea78d34715fba8ac",
"assets/images/kotak/kotak_28.png": "52a9f643560c89a77c38ba8fe6d581e0",
"assets/images/kotak/kotak_25.png": "f1711add8670a380c664526b1053be13",
"assets/images/kotak/kotak_31.png": "36478794943d4d598476ff6653fc528b",
"assets/images/kotak/kotak_19.png": "7941698ff27a0472b4ad4027aac03830",
"assets/images/kotak/kotak_18.png": "c564c79aa86d0b29fa4e7ded1ebc12e0",
"assets/images/kotak/kotak_30.png": "038f11162015b307bb8adcf719c020c8",
"assets/images/kotak/kotak_24.png": "dc53777375f1b3cb0b7bbd5e7b6aa062",
"assets/images/kotak/kotak_32.png": "238407669453de50af3134f97f71dd4f",
"assets/images/kotak/kotak_26.png": "9d7cab03eb2894a63d4b4d5b221629fb",
"assets/images/kotak/kotak_27.png": "298804688a6b0065f3c67abc83ac9494",
"assets/images/kotak/kotak_33.png": "90251bdeb926408cb73c25d416fc3285",
"assets/images/kotak/kotak_37.png": "671c0b1a24e4cd0257ba29fe23fa885d",
"assets/images/kotak/kotak_23.png": "fca4066112ad61eb203d55f4c136e613",
"assets/images/kotak/kotak_22.png": "cb948ab5652cfa1dc4779bd35df50b80",
"assets/images/kotak/kotak_36.png": "734b83be58f2578c2ce2246d1830e859",
"assets/images/kotak/kotak_20.png": "467ad990bf16e43cefa751db2a20f7db",
"assets/images/kotak/kotak_34.png": "8d547fe88d9a83ce333c5ba549511329",
"assets/images/kotak/kotak_35.png": "875730af6866210b251967e5b74b3d1d",
"assets/images/kotak/kotak_21.png": "108320af16d221477b8284da11020ba8",
"assets/images/kotak/kotak_46.png": "0e1439f068d2dcc7e23469326da0ed30",
"assets/images/kotak/kotak_52.png": "2262ed4323e1ad1f34db836af890d8e5",
"assets/images/kotak/kotak_85.png": "f655e94518f3574368bc9f99edb8c968",
"assets/images/kotak/kotak_91.png": "6f708167cd50e318ff45a412ad289651",
"assets/images/kotak/kotak_100.png": "8593ae93e2400872182bfea8c16eec63",
"assets/images/kotak/kotak_90.png": "6c5e9605c5f980336b21490524fa769d",
"assets/images/kotak/kotak_84.png": "6e5d48300d9bee55bc1edf3d40f6c6cd",
"assets/images/kotak/kotak_53.png": "9438a30c80f7d7768b32d19d7990742f",
"assets/images/kotak/kotak_47.png": "6ea938577a67d0d7ba96a2f0b91502b7",
"assets/images/kotak/kotak_51.png": "73ef29e5757acace83e6d21419d4f76a",
"assets/images/kotak/kotak_45.png": "1f808876f1d04ba4500fc44121335b9e",
"assets/images/kotak/kotak_79.png": "8f80c012e2b7d284bc04f3ca62159592",
"assets/images/kotak/kotak_92.png": "447a1958a68824b6507cfb22b6cbf10d",
"assets/images/kotak/kotak_86.png": "08f7da35e52c90210bdecd0f34d4f425",
"assets/images/kotak/kotak_8.png": "2f0e83eb263f93b3d4435f8055f5cd5d",
"assets/images/kotak/kotak_9.png": "e7539977e7e0a0b13bf7ba24f5675f94",
"assets/images/kotak/kotak_87.png": "c43f7e352c35edd5a349d5e065162e3c",
"assets/images/kotak/kotak_93.png": "b4442fb71e5bc8fd961ca23239fd6630",
"assets/images/kotak/kotak_78.png": "ead0218c1cc8ada886b95f33fb905510",
"assets/images/kotak/kotak_44.png": "485b703a7a7294add8cb6c25216602fe",
"assets/images/kotak/kotak_50.png": "1b4c0501f2d25ede89b18d004c4bd600",
"assets/images/kotak/kotak_68.png": "7f1a924d080e86eb181a26328c9c9d19",
"assets/images/kotak/kotak_54.png": "9c2c3cd92254abd4bc6242ef4a316007",
"assets/images/kotak/kotak_40.png": "e78711b2229f4bb5f3d1b4d6f7a5c332",
"assets/images/kotak/kotak_97.png": "214b8b5efd7ea70ac4bada47e95823d1",
"assets/images/kotak/kotak_83.png": "055949485de51644bdef1cb5b7f7a416",
"assets/images/kotak/kotak_82.png": "ba8f0347a6a84142bf2890d0d9978947",
"assets/images/kotak/kotak_96.png": "a2512e4f5218c5e65b2ba7660a10f526",
"assets/images/kotak/kotak_41.png": "86bddabb4b8543e8a7fff9e45c1e5270",
"assets/images/kotak/kotak_55.png": "43cd90233b259801b73e05a657681c18",
"assets/images/kotak/kotak_69.png": "8790cdcfd548e0af0f5e02a2a326f733",
"assets/images/kotak/kotak_43.png": "8a4ae871cbc4fe9334bfd48c4914a30b",
"assets/images/kotak/kotak_57.png": "e80597c9226842d9c6ecb91bb2287928",
"assets/images/kotak/kotak_80.png": "7f59131ec2e20ee86d4a686845a8c193",
"assets/images/kotak/kotak_94.png": "0e77762b72b5ad27c390a5e556577cc5",
"assets/images/kotak/kotak_95.png": "5334a897d722a63a5da3d7bd23c129f1",
"assets/images/kotak/kotak_81.png": "183e519a070ca158ebf92ae14f69b50c",
"assets/images/kotak/kotak_56.png": "294a6d5c3a53ff7092244a6b275c26f0",
"assets/images/kotak/kotak_42.png": "dfa79db3d5a10d420fc2110d1c778b49",
"assets/images/dice/Dice%25206.png": "06a15b2187f2f6cb6b575bed4739e2d0",
"assets/images/dice/Dice%25204.png": "46a2a8699d189713c1a87646c35ac183",
"assets/images/dice/Dice%25205.png": "d163e7a11b8871da3e4f38283db221ed",
"assets/images/dice/Dice%25201.png": "418a3d0c768589365524c61d567ea61d",
"assets/images/dice/Dice%25202.png": "498d2b1d5323627aff942deab10a4d7a",
"assets/images/dice/Dice%25203.png": "26ab3f9edc3ea8b2f47ca6338c5ec5ce",
"assets/images/rocket_logo.png": "47934f016f6b2ee305c87520f3f7a49a",
"assets/images/rocket.png": "617178830f4dd1b145fc2f2b8780d211",
"assets/images/logo.png": "98111a20fe33d375eed4620f35e9ce0b",
"assets/images/cover.jpg": "2ea392372b6dbaee8ad01aaded361984",
"assets/images/um_logo.png": "78a5d89c798482857350b285a19649c9",
"assets/images/nanomite_logo.png": "d3bae855a0202cae83c32965ed679db1",
"assets/images/um_logo_dentist.png": "7900bbd81f9def39130486b119f11edc",
"assets/images/peneraju_logo.png": "9545c4d6d7436007da38afe46ec98179",
"assets/lotties/number-4.json": "8d4c30870582e760db13bf24a72b7ae0",
"assets/lotties/emoji_4.json": "1d644ae910087f03033f0def8498c03b",
"assets/lotties/number-5.json": "9147efaabced14308a0b9e5cb4385454",
"assets/lotties/loading-checkpoint.json": "1d8a93cd8d7b694be520b3254fe0bbc2",
"assets/lotties/number-2.json": "858555f78acbeaeaf2e44f3591797724",
"assets/lotties/emoji_3.json": "59d732a80b735693e1b138ccd852263c",
"assets/lotties/emoji_2.json": "50f119054b59f20f2900c755240478b4",
"assets/lotties/betul.json": "cf82be80d9725f0f7bfe09b323c42048",
"assets/lotties/number-3.json": "9fbb4d3b54267368b5fdff7d982284e1",
"assets/lotties/dice.json": "c5a513d06623c1fd36aaf27dcef25bce",
"assets/lotties/emoji_1.json": "fe5bc30d091cf4f02da97676a066b460",
"assets/lotties/number-1.json": "2fafa10ea5fb6dc8b8c908145cf34798",
"assets/lotties/wrong.json": "fbeda577824789ca381d285560f786bf",
"assets/AssetManifest.json": "df207be0f48a6d24915ce241ed122013",
"assets/NOTICES": "1d41f76a006fb79917f3b04856407a30",
"assets/videos/kuiz_video_1.mp4": "61e1426fcfa9e5fd9d9c511d7e12bd6f",
"assets/FontManifest.json": "796596f335025b0c32338c70a3f1856d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/packages/flutter_inappwebview/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/fonts/Lucky%2520Boss.ttf": "a653e4e5ec3468ffde238e6e5d40e1c5",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/fonts/Roboto-Bold.ttf": "36b5bab58a18b9c924861a4ccbf1a790"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
