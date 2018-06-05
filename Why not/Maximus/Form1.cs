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

            //string selectQuery19 = "Select DISTINCT name_post from post";
            //MySqlDataAdapter da19 = new MySqlDataAdapter(selectQuery19, connection);
            //DataSet ds19 = new DataSet();
            //da19.Fill(ds19);
            //comboBox16.DataSource = ds19.Tables[0];
            //comboBox16.DisplayMember = "id_post";
            //comboBox16.ValueMember = "name_post";
            //comboBox9.DataSource = ds19.Tables[0];
            //comboBox9.DisplayMember = "id_post";
            //comboBox9.ValueMember = "name_post";

            //string selectQuery199 = "Select DISTINCT name_degree from degree";
            //MySqlDataAdapter da199 = new MySqlDataAdapter(selectQuery199, connection);
            //DataSet ds199 = new DataSet();
            //da199.Fill(ds199);
            //comboBox19.DataSource = ds199.Tables[0];
            //comboBox19.DisplayMember = "id_degree";
            //comboBox19.ValueMember = "name_degree";
            //comboBox23.DataSource = ds199.Tables[0];
            //comboBox23.DisplayMember = "id_degree";
            //comboBox23.ValueMember = "name_degree";

            //string selectQuery21 = "Select DISTINCT card_num from teachers";
            //MySqlDataAdapter da21 = new MySqlDataAdapter(selectQuery21, connection);
            //DataSet ds21 = new DataSet();
            //da21.Fill(ds21);
            //comboBox21.DataSource = ds21.Tables[0];
            //comboBox21.DisplayMember = "card_num";
            //comboBox21.ValueMember = "card_num";
            //comboBox24.DataSource = ds21.Tables[0];
            //comboBox24.DisplayMember = "card_num";
            //comboBox24.ValueMember = "card_num";


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
            //string nomy = Convert.ToString(textBox11.Text);
            //string staj = Convert.ToString(textBox15.Text);
            //string fiop = Convert.ToString(textBox12.Text);
 

            //string selectQuery13t = "INSERT INTO teachers(card_num, experience, FIO_teacher, id_department, id_post, id_degree) VALUES ('" + nomy + "','" + staj +"','"+ fiop + "',(SELECT id_department FROM department where name_department = '"+ comboBox20.SelectedValue.ToString() + "'), (SELECT id_post FROM post where name_post = '"+ comboBox16.SelectedValue.ToString() + "'), (SELECT id_degree FROM degree where name_degree = '"+ comboBox19.SelectedValue.ToString() + "') )";
            //MySqlCommand da13 = new MySqlCommand(selectQuery13t, connection);
            //connection.Open();
            //da13.ExecuteNonQuery();
            //MessageBox.Show("Преподаватель добавлен!");

        }//Добавить нового препода!

        private void button11_Click(object sender, EventArgs e)
        {
            //string fiop = Convert.ToString(textBox10.Text);
            //string staj = Convert.ToString(textBox16.Text);

            //string selectQuery13 = "UPDATE teachers SET card_num='" + comboBox21.SelectedValue.ToString() + "', experience='" + staj+"', FIO_teacher='" + fiop + "', id_department=(SELECT id_department FROM department where name_department = '" + comboBox22.SelectedValue.ToString() + "'), id_post=(SELECT id_post FROM post where name_post = '" + comboBox9.SelectedValue.ToString() + "'),id_degree=(SELECT id_degree FROM degree where name_degree = '" + comboBox23.SelectedValue.ToString() + "') WHERE card_num='" + comboBox21.SelectedValue.ToString() + "'";
            //MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            //connection.Open();
            //da13.ExecuteNonQuery();
            //MessageBox.Show("Данные изменены!");
        }//Изменить данные о преподе!

        private void button12_Click(object sender, EventArgs e)
        {
            //string fiop = Convert.ToString(textBox14.Text);

            //string selectQuery14 = "DELETE FROM teachers where card_num = '" + comboBox24.SelectedValue.ToString() + "'";
            //MySqlCommand da13 = new MySqlCommand(selectQuery14, connection);
            //connection.Open();
            //da13.ExecuteNonQuery();
            //MessageBox.Show("Преподаватель удален!");
        }//Уволить препода!


    }
}

