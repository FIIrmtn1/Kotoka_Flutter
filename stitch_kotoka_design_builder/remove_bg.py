"""
AI-based background remover using rembg (U2Net model).
Produces ~99% accurate transparent PNGs preserving original colors.
Run: python stitch_kotoka_design_builder/remove_bg.py
Output: stitch_kotoka_design_builder/kotoka_logo/
"""
import os
from rembg import remove
from PIL import Image

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "kotoka_logo")
os.makedirs(OUTPUT_DIR, exist_ok=True)

TARGETS = [
    ("Kokoanimation/graduate_koko.png", "graduate_koko_nobg.png"),
    ("Kokoanimation/child_koko.png",    "child_koko_nobg.png"),
]

base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

for src_rel, dst_name in TARGETS:
    src = os.path.join(base, src_rel)
    dst = os.path.join(OUTPUT_DIR, dst_name)

    if not os.path.exists(src):
        print(f"[MISSING] Not found: {src}")
        continue

    print(f"Processing: {src_rel} ...")
    with open(src, "rb") as f:
        input_data = f.read()

    output_data = remove(input_data)

    with open(dst, "wb") as f:
        f.write(output_data)

    # Verify output
    img = Image.open(dst)
    print(f"[OK] {dst_name}  size={img.size}  mode={img.mode}")

print("\nDone. Files saved to stitch_kotoka_design_builder/kotoka_logo/")
