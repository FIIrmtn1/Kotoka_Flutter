const { chromium } = require('playwright');
const path = require('path');
const fs = require('fs');

const BASE_URL = 'http://localhost:5000';
const OUT_DIR = path.join(__dirname, 'screenshots');
if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

const SCREENS = [
  { name: 'welcome',       url: '/',              desc: 'Welcome / Onboarding start' },
  { name: 'home',          url: '/home',          desc: 'Home tab — streak + missions' },
  { name: 'snap',          url: '/snap',          desc: 'Snap tab — camera input' },
  { name: 'review',        url: '/review',        desc: 'Review tab — SRS session' },
  { name: 'shop',          url: '/shop',          desc: 'Shop tab' },
  { name: 'profile',       url: '/profile',       desc: 'Profile tab' },
];

(async () => {
  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({
    viewport: { width: 390, height: 844 },   // iPhone 14 Pro
    deviceScaleFactor: 2,
  });

  const results = [];

  for (const screen of SCREENS) {
    const page = await context.newPage();
    try {
      await page.goto(BASE_URL + screen.url, { waitUntil: 'networkidle', timeout: 15000 });
      await page.waitForTimeout(1500);   // let Flutter render
      const file = path.join(OUT_DIR, `${screen.name}.png`);
      await page.screenshot({ path: file, fullPage: false });
      results.push({ ...screen, file, ok: true });
      console.log(`✅ ${screen.name} → ${file}`);
    } catch (e) {
      results.push({ ...screen, ok: false, error: e.message });
      console.log(`⚠️  ${screen.name} failed: ${e.message}`);
    } finally {
      await page.close();
    }
  }

  await browser.close();

  // Write manifest for customer agents
  fs.writeFileSync(
    path.join(OUT_DIR, 'manifest.json'),
    JSON.stringify({ captured: new Date().toISOString(), screens: results }, null, 2)
  );
  console.log('\nManifest written → feedback/screenshots/manifest.json');
  console.log(`Captured ${results.filter(r => r.ok).length}/${results.length} screens`);
})();
