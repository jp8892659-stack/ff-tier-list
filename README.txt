FF TIER LIST — ชุดเว็บไซต์เริ่มต้น

ไฟล์:
- index.html = หน้าเว็บ
- supabase_schema.sql = โครงสร้างฐานข้อมูล (ไม่ต้องรันซ้ำถ้าตารางเดิมมีอยู่แล้ว)

การตั้งค่า:
- ใส่ Project URL และ Publishable key ไว้ใน index.html แล้ว
- อย่าใส่ service_role key ในเว็บ
- แอดมินต้องเป็นบัญชี Supabase Auth ที่อีเมลตรงกับ public.is_ff_admin()
- ตารางที่หน้าเว็บคาดหวัง: applications(player_name, uid, region, proof_url, status, created_at), players(player_name, uid, tier)

ขั้นตอนต่อไป:
1. อัปโหลด index.html ไป GitHub repository
2. เปิด Settings > Pages แล้ว Deploy จาก branch main / root
3. รอ URL ของ GitHub Pages แล้วแชร์ให้ผู้เล่น

ข้อควรระวัง:
หาก SQL schema เดิมของคุณใช้ชื่อคอลัมน์ไม่ตรงกับรายการข้างบน หน้าเว็บอาจแจ้ง error ต้องปรับให้ตรงก่อน deploy.
