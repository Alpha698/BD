using System;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Collections;
using System.Data.OleDb;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        //Строка подключения к бд
        MySqlConnection connection = new MySqlConnection("server=localhost;port=3306; Initial Catalog='hospital';username=root;password=;SslMode=none");
        private void Form1_Load(object sender, EventArgs e)
        {

            /*ДЛЯ ПЕРВОЙ ВКЛАДКИ*/

            //Вывести дату визита, ФИО и адресс пациента, фио врача, из таблицы visit обьеденив patient и visit по полю nomer_card, а также doctor и visit по полю nom_diploma
            string selectQuery5 = @"Select visit.visit_date, patient.FIOpats, patient.adress, doctor.FIO
from visit
inner join patient on patient.nomer_card = visit.nomer_card
inner join doctor on doctor.nom_diploma = visit.nom_diploma";
            DataTable table = new DataTable(); 
            MySqlDataAdapter adapter = new MySqlDataAdapter(selectQuery5, connection); //Отработка запроса и подключения к бд
            adapter.Fill(table);
            //Вывод результата в таблицу dataGridView4
            dataGridView4.DataSource = table;
            //Имена столбцов(можно не задавать, тогда будут названия столбцов с бд)
            dataGridView4.Columns[0].HeaderText = "Дата записи";
            dataGridView4.Columns[1].HeaderText = "ФИО пациента";
            dataGridView4.Columns[2].HeaderText = "Адресс пациента";
            dataGridView4.Columns[3].HeaderText = "ФИО врача";
            //Ширина столбцов(можно не указывато, тогда будет 100)
            dataGridView4.Columns[0].MinimumWidth = 125;
            dataGridView4.Columns[1].MinimumWidth = 125;
            dataGridView4.Columns[2].MinimumWidth = 125;
            dataGridView4.Columns[3].MinimumWidth = 125;

            /*ДЛЯ ВТОРОЙ ВКЛАДКИ*/

            //Вывести номер диплома, фио, стаж, зп, категорию и специальность врача из таблицы doctor обьеденив category и doctor , а также specialty и doctor 
            string selectQuery115 = @"Select doctor.nom_diploma, doctor.FIO,doctor.staj, doctor.zarplata, category.name_categ, specialty.name_spec
from doctor
inner join category on category.id_categ = doctor.id_categ
inner join specialty on specialty.id_spec = doctor.id_spec";
            DataTable table115 = new DataTable();
            MySqlDataAdapter adapter115 = new MySqlDataAdapter(selectQuery115, connection); //Отработка запроса и подключения к бд
            adapter115.Fill(table115);
            //Вывод результата в таблицу dataGridView1
            dataGridView1.DataSource = table115;
            //Имена столбцов(можно не задавать, тогда будут названия столбцов с бд)
            dataGridView1.Columns[0].HeaderText = "Номер диплома";
            dataGridView1.Columns[1].HeaderText = "ФИО врача";
            dataGridView1.Columns[2].HeaderText = "Стаж работы";
            dataGridView1.Columns[3].HeaderText = "Оклад";
            dataGridView1.Columns[4].HeaderText = "Категория";
            dataGridView1.Columns[5].HeaderText = "Специализация";

            string selectQuery17 = "Select DISTINCT FIO from doctor"; //Вывод без повторений всех ФИО врачей
            MySqlDataAdapter da17 = new MySqlDataAdapter(selectQuery17, connection);//Отработка запроса и подключения к бд
            DataSet ds17 = new DataSet();
            da17.Fill(ds17);
            //Вывод результата в элемент comboBox18(выпадающий список)
            comboBox18.DataSource = ds17.Tables[0];
            comboBox18.DisplayMember = "nom_diploma";
            comboBox18.ValueMember = "FIO";

            string selectQuery18 = "Select DISTINCT name_spec from specialty"; //Вывод без повторений всех специализаций врачей
            MySqlDataAdapter da18 = new MySqlDataAdapter(selectQuery18, connection);//Отработка запроса и подключения к бд
            DataSet ds18 = new DataSet();
            da18.Fill(ds18);
            //Вывод результата в элемент comboBox20(выпадающий список)
            comboBox20.DataSource = ds18.Tables[0];
            comboBox20.DisplayMember = "id_spec";
            comboBox20.ValueMember = "name_spec";
            comboBox1.DataSource = ds18.Tables[0];
            comboBox1.DisplayMember = "id_spec";
            comboBox1.ValueMember = "name_spec";

            string selectQuery199 = "Select DISTINCT name_categ from category";//Вывод без повторений всех категорий врачей
            MySqlDataAdapter da199 = new MySqlDataAdapter(selectQuery199, connection);//Отработка запроса и подключения к бд
            DataSet ds199 = new DataSet();
            da199.Fill(ds199);
            //Вывод результата в элемент comboBox19(выпадающий список)
            comboBox19.DataSource = ds199.Tables[0];
            comboBox19.DisplayMember = "id_categ";
            comboBox19.ValueMember = "name_categ";
            //Вывод результата в элемент comboBox2(выпадающий список)
            comboBox2.DataSource = ds199.Tables[0];
            comboBox2.DisplayMember = "id_categ";
            comboBox2.ValueMember = "name_categ";

            string selectQuery21 = "Select DISTINCT nom_diploma from doctor";//Вывод без повторений всех номеров диплома врачей
            MySqlDataAdapter da21 = new MySqlDataAdapter(selectQuery21, connection);//Отработка запроса и подключения к бд
            DataSet ds21 = new DataSet();
            da21.Fill(ds21);
            //Вывод результата в элемент comboBox21(выпадающий список)
            comboBox21.DataSource = ds21.Tables[0];
            comboBox21.DisplayMember = "nom_diploma";
            comboBox21.ValueMember = "nom_diploma";
            //Вывод результата в элемент comboBox3(выпадающий список)
            comboBox3.DataSource = ds21.Tables[0];
            comboBox3.DisplayMember = "nom_diploma";
            comboBox3.ValueMember = "nom_diploma";

            /*ДЛЯ ТРЕТЕЙ ВКЛАДКИ*/

            //Вывести всех данных о пациентах из таблицы patient 
            string selectQuery135 = @"Select patient.nomer_card, patient.FIOpats,patient.sex, patient.adress, patient.birthday, patient.tel_number, illness.name_ill
from patient
inner join illness on illness.id_ill = patient.id_ill";
            DataTable table135 = new DataTable();
            MySqlDataAdapter adapter135 = new MySqlDataAdapter(selectQuery135, connection); //Отработка запроса и подключения к бд
            adapter135.Fill(table135);
            //Вывод результата в таблицу dataGridView3
            dataGridView3.DataSource = table135;
            //Имена столбцов(можно не задавать, тогда будут названия столбцов с бд)
            dataGridView3.Columns[0].HeaderText = "Номер карты";
            dataGridView3.Columns[1].HeaderText = "ФИО пациента";
            dataGridView3.Columns[2].HeaderText = "пол";
            dataGridView3.Columns[3].HeaderText = "Адресс";
            dataGridView3.Columns[4].HeaderText = "Дата рождения";
            dataGridView3.Columns[5].HeaderText = "Контакты";
            dataGridView3.Columns[6].HeaderText = "Болезнь";

            string selectQuery171 = "Select FIOpats from patient "; //Вывод без повторений всех пациентов
            MySqlDataAdapter da171 = new MySqlDataAdapter(selectQuery171, connection);//Отработка запроса и подключения к бд
            DataSet ds171 = new DataSet();
            da171.Fill(ds171);
            //Вывод результата в элемент comboBox6(выпадающий список)
            comboBox6.DataSource = ds171.Tables[0];
            comboBox6.DisplayMember = "nomer_card";
            comboBox6.ValueMember = "FIOpats";

        }//Подгрузка данных при запуске приложения!

        private void button4_Click(object sender, EventArgs e)
        {
            Application.Restart();
        }//Перезагрузка приложения!

        private void button14_Click(object sender, EventArgs e)
        {
            //Вывод номера диплома, фио, специальности из таблицы доктор, обеденив специальность с доктором, если имя доктора совпадает с выбранным из выпадающего списка
            string selectQuery77 = @"SELECT doctor.nom_diploma, doctor.FIO, specialty.name_spec
                                    FROM doctor
                                    INNER join specialty on specialty.id_spec=doctor.id_spec
            Where doctor.FIO='" + comboBox18.SelectedValue.ToString() + "'";
            DataTable tableay1 = new DataTable();
            MySqlDataAdapter adapteray1 = new MySqlDataAdapter(selectQuery77, connection); //Отработка запроса и подключения к бд
            adapteray1.Fill(tableay1);
            //Вывод результата в таблицу dataGridView2
            dataGridView2.DataSource = tableay1;
            //Имена столбцов(можно не задавать, тогда будут названия столбцов с бд)
            dataGridView2.Columns[0].HeaderText = "Номер диплома";
            dataGridView2.Columns[1].HeaderText = "ФИО";
            dataGridView2.Columns[2].HeaderText = "Смециализация";

        }//Поиск врача по ФИО!

        private void button13_Click(object sender, EventArgs e)
        {
            string nomd = Convert.ToString(textBox11.Text);// Запись в перемонную значения с textBox 
            string fiovr = Convert.ToString(textBox12.Text);// Запись в перемонную значения с textBox 
            string staj = Convert.ToString(textBox15.Text);// Запись в перемонную значения с textBox 
            string oklad = Convert.ToString(textBox1.Text);// Запись в перемонную значения с textBox 
            //Добавляет в таблицу доктор запись со значениями из текстбоксов и выпадающих списков...
            string selectQuery13t = "INSERT INTO doctor(nom_diploma, FIO, staj, zarplata, id_categ, id_spec) VALUES ('" + nomd + "','" + fiovr + "','" + staj + "','" + oklad + "',(SELECT id_categ FROM category where name_categ = '" + comboBox19.SelectedValue.ToString() + "'), (SELECT id_spec FROM specialty where name_spec = '" + comboBox20.SelectedValue.ToString() + "') )";
            MySqlCommand da13 = new MySqlCommand(selectQuery13t, connection);//Отработка запроса и подключения к бд
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Преподаватель добавлен!");//Вывод сообщения об успехе

        }//Добавление нового врача!

        private void button11_Click(object sender, EventArgs e)
        {
            string fiovr = Convert.ToString(textBox10.Text);// Запись в перемонную значения с textBox 
            string staj = Convert.ToString(textBox16.Text);// Запись в перемонную значения с textBox 
            string oklad = Convert.ToString(textBox2.Text);// Запись в перемонную значения с textBox 
            //Обновляет (перезаписывает) запись...
            string selectQuery13 = "UPDATE doctor SET nom_diploma='" + comboBox21.SelectedValue.ToString() + "', FIO='" + fiovr + "', staj='" + staj + "', zarplata='" + oklad + "', id_categ=(SELECT id_categ FROM category where name_categ = '" + comboBox2.SelectedValue.ToString() + "'), id_spec=(SELECT id_spec FROM specialty where name_spec = '" + comboBox1.SelectedValue.ToString() + "') WHERE nom_diploma='" + comboBox21.SelectedValue.ToString() + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Данные изменены!");//Вывод сообщения об успехе
        }//Изменение данных о враче!

        private void button12_Click(object sender, EventArgs e)
        {
            string fiovr = Convert.ToString(textBox3.Text);
            //Удаляет запись из таблицы доктор если совпал номер диплома
            string selectQuery14 = "DELETE FROM doctor where nom_diploma = '" + comboBox3.SelectedValue.ToString() + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery14, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Преподаватель удален!");//Вывод сообщения об успехе
        }//Удаление врача!

        private void button1_Click(object sender, EventArgs e)
        {
            string selectQuery77 = @"SELECT patient.FIOpats, illness.name_ill
                                    FROM patient
                                    INNER join illness on illness.id_ill = patient.id_ill
            Where patient.FIOpats='" + comboBox6.SelectedValue.ToString() + "'";
            DataTable tableay1 = new DataTable();
            MySqlDataAdapter adapteray1 = new MySqlDataAdapter(selectQuery77, connection); //Отработка запроса и подключения к бд
            adapteray1.Fill(tableay1);
            //Вывод результата в таблицу dataGridView2
            dataGridView5.DataSource = tableay1;
            //Имена столбцов(можно не задавать, тогда будут названия столбцов с бд)
            dataGridView5.Columns[0].HeaderText = "ФИО пациента";
            dataGridView5.Columns[1].HeaderText = "Заболевание";
        }//Поиск пациентов по болезни
    }
}

