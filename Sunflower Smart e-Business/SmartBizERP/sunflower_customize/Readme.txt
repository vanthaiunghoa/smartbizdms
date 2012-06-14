Neu cai dat tren may local thi config url giong nhu tren hosting: vi du: default url: http://localhost/opencart/ => config thanh http://local.opencart/
Cac buoc cai dat:
1. Download opencart 1.5.1.2
2. Unzip opencart 1.5.1.2
3. Copy opencart 1.5.1.2 vao folder webroot (dat ten tuy y)
4. Create database name.
5. Tien hanh cai dat opencart binh thuong de tao file root/config.php va root/admin/config.php
6. copy toan bo source trong folder sunflower vao thu muc root cua 
7. vao phpmyadmin chon import de restore file sunflowervn.sql trong folder sunflower.
	(Trong file sunflowervn.sql da co chua cac du lieu da duoc cai dat cac module)
8. Ket thuc qua trinh cai dat va chay doi ten hoac delete folder install va chay thu.
Copy all source code from sunflower folder replace to run project
Don't forget run file sql: [update_sql_release_final.sql]
Go to menu System => Setting => click to [Edit] At tab [Store] -> Change tempate from default to smartbiz

Note: If Run catalog item in admin that it is show error about permission.
Please go to menu System => Users => User Groups => Click to link [Edit] of Top Administrator then you find name of link and check to checkbox
to assign permission to it => Click to Save button. Go back to try again.


