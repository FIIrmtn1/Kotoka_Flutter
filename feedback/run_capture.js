const { chromium } = require('playwright');
const path = require('path');
const fs = require('fs');

const SCREENS_DIR = path.join(__dirname, 'screens');
const OUT_DIR = path.join(__dirname, 'screenshots');
if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

const FILES = [
  { file: '01_welcome.html',         name: 'welcome' },
  { file: '02_language_select.html', name: 'language_select' },
  { file: '03_pdpa_consent.html',    name: 'pdpa_consent' },
  { file: '04_home.html',            name: 'home' },
  { file: '05_review_session.html',  name: 'review_session' },
];

(async () => {
  const browser = await chromium.launch({ headless: true });
  const ctx = await browser.newContext({
    viewport: { width: 1080, height: 1080 },
    deviceScaleFactor: 2,
  });

  for (const s of FILES) {
    const page = await ctx.newPage();
    const filePath = path.join(SCREENS_DIR, s.file);
    const url = 'file:///' + filePath.split(path.sep).join('/');
    await page.goto(url);
    await page.waitForTimeout(1800);
    const out = path.join(OUT_DIR, s.name + '.png');
    await page.screenshot({ path: out, fullPage: false });
    console.log('captured: ' + s.name + ' -> ' + out);
    await page.close();
  }

  await browser.close();

  fs.writeFileSync(
    path.join(OUT_DIR, 'manifest.json'),
    JSON.stringify({ captured: new Date().toISOString(), count: FILES.length }, null, 2)
  );
  console.log('DONE — ' + FILES.length + ' screenshots in feedback/screenshots/');
})().catch(e => { console.error('FAIL:', e.message); process.exit(1); });
