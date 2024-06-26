'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "3748ef23a633eb607d0ab8b3fef5d707",
"assets/AssetManifest.bin.json": "6735971af31aa8543622cb2cfb77a0ba",
"assets/AssetManifest.json": "b783c9169b93a830a3d194b795400d65",
"assets/assets/fonts/NotoSerifBengali-Black.ttf": "4440a9fe1b6c48203645c79376c3a9be",
"assets/assets/fonts/NotoSerifBengali-Bold.ttf": "eccf90709f61853a4aa1d184f8e54216",
"assets/assets/fonts/NotoSerifBengali-ExtraBold.ttf": "1bcb8d0c0a8564213924a4c6d417ca15",
"assets/assets/fonts/NotoSerifBengali-ExtraLight.ttf": "654b0063c75b07b7bb661ce5c62f4b26",
"assets/assets/fonts/NotoSerifBengali-Light.ttf": "1890d63acffba90859e2bfb2bea18035",
"assets/assets/fonts/NotoSerifBengali-Medium.ttf": "643e3c26e483899d95c0a8333cf79a6a",
"assets/assets/fonts/NotoSerifBengali-Regular.ttf": "7de2929b2584456afd8251c356de1285",
"assets/assets/fonts/NotoSerifBengali-SemiBold.ttf": "2dbbd25963188760d70eaa925bfd9d11",
"assets/assets/fonts/NotoSerifBengali-Thin.ttf": "9ac5e7bc4f744b2f0aa8d5455555f2d2",
"assets/assets/images/aio_logo.png": "b4e4f27781bc176627674c7519014d74",
"assets/assets/images/apple.png": "a1434414d34959576ac32d66b6f0d753",
"assets/assets/images/book_open.png": "153a8882ac839411165ba1a7988e4647",
"assets/assets/images/clipboard_download.png": "f872ffad1ff4378c35133eb1a2f9e8e0",
"assets/assets/images/cv.png": "0a9ce173839673b50dac9d0f29442dab",
"assets/assets/images/dollar_circle.png": "42b787668d041e5b6ed2313303e58736",
"assets/assets/images/edit.png": "75a28c9881979d9b21b99d13aca77cea",
"assets/assets/images/empty_course.png": "782f7c3a5575e1583ad7c5f8c46a8f1d",
"assets/assets/images/facebook.png": "78a517a9ec2e59fcf75995eab08c5646",
"assets/assets/images/file.png": "f9a75376f5bd6d1514cf98b88148b0cc",
"assets/assets/images/flash_screen.png": "737bf9e0d793a23ee9daf6d9df3f3cf6",
"assets/assets/images/frame1.png": "748a461d2d29b1e3b4e6a7bfdc14d30a",
"assets/assets/images/google.png": "6ec0397d109b2267c3c077f221f201ae",
"assets/assets/images/job.png": "6cc5453ac124e88ecb457c1fb9167448",
"assets/assets/images/link1.png": "1fb6ad28722efc0e71e17a0d33f7d454",
"assets/assets/images/link2.png": "5af709e9e68f61952978b5d17391dd99",
"assets/assets/images/link3.png": "414bc4f62a55b7f9bb927e0868913885",
"assets/assets/images/login_web_expended.png": "f0325feef6bedaf78262266f8463b68a",
"assets/assets/images/logo.png": "6c734f54ec7f869125ceb5f3979510da",
"assets/assets/images/profile_pic.png": "5724d9839527433847d9816d4adc3e75",
"assets/assets/images/profile_pic_bg.png": "1637a7e0a16307121886d215e3fdcb46",
"assets/assets/images/rectangle43.png": "e1e7c3b01a27bbda28738c8836634b40",
"assets/assets/images/refresh.png": "da500321c58bb80a0e995985160d4bec",
"assets/assets/images/register_web_expended.png": "ee434dc3e8a9d8676c5975092560817c",
"assets/assets/images/reg_complete.png": "667cb0969c4e3af6824844cfd6539d54",
"assets/assets/images/request_submitted.png": "4b70a45870bb00922d1779503b6afd7a",
"assets/assets/images/send1.png": "cbaa150897a8591cab37a145bcd90c57",
"assets/assets/images/send2.png": "d31faf90e674bcff08f07adbe676764b",
"assets/assets/images/tcs.png": "f6b91e3dfa776c5dea3e9d621e9dd49b",
"assets/assets/images/thumbnail1.png": "cab930fb263a1bfb12eee6b20716313e",
"assets/assets/images/thumbnail2.png": "b13b2b5bce7a8767ac385034db585838",
"assets/assets/images/thumbnail3.png": "908a1153000a044d25eaeae706b6a445",
"assets/assets/images/thumbnail4.png": "abdce42875cf395bb9d121148970995d",
"assets/assets/images/thumbnail5.png": "dd898ee4c3a687556a3568e2539452ee",
"assets/assets/images/thumbnail6.png": "f888e07e413d187ab75fe7895b380037",
"assets/assets/images/thumbnail7.png": "f850eb4799416c9c3c544dc9549fe05e",
"assets/assets/images/trash.png": "2ddb1b27cf20b91b762637406087316c",
"assets/assets/images/users.png": "84c6836aca99b64bdfd796ef7653cefc",
"assets/assets/images/user_plus.png": "05072e49e71f8f177f567cc09bd577d9",
"assets/assets/images/verification_pending.png": "46c1067e96d4fa21328f40986e1515ce",
"assets/FontManifest.json": "ddfb13d7e9191c1d373f32fd77c4f00c",
"assets/fonts/MaterialIcons-Regular.otf": "91cbd7c9feaefbde76aefde8d8890d7d",
"assets/NOTICES": "dd2457bb0a770296f145b16cf616e361",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "164b267da3e74d5b484062552741628e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4638d1b8bb1031c8eff05c42b54af0da",
"/": "4638d1b8bb1031c8eff05c42b54af0da",
"main.dart.js": "c81ebe40f5fa4e285166d5e45148ce73",
"manifest.json": "93bfca4df651b7316ba41fe3c20f2108",
"version.json": "55115477995e093c16e22d2326b2e45e"};
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
