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
        MySqlConnection connection = new MySqlConnection("server=localhost;port=3306; Initial Catalog='libraryv3_0';username=root;password=;SslMode=none");
        private void Form1_Load(object sender, EventArgs e)
        {
            //string selectQuery5 = @"Select study_group.name_group, day_week.name_day, number_lesson.number, discipline.name_discipline, teachers.FIO_teacher, audience.number_aud, number_lesson.week_start, number_lesson.week_end
            //                        from  discipline, sschedule
            //                        inner join study_group on study_group.id_group = sschedule.id_group 
            //                        inner join audience on audience.number_aud = sschedule.number_aud
            //                        inner join teachers on teachers.card_num = sschedule.card_num                
            //                        inner join day_week on day_week.id_day = sschedule.id_day 
            //                        inner join type_occupation on type_occupation.id_type = sschedule.id_type
            //                        inner join number_lesson on number_lesson.id_num = sschedule.id_num
            //                        WHERE study_group.id_specialty IN (Select id_specialty from specialty
            //                                                            where  discipline.id_discipline = specialty.id_discipline)";
            string selectQuery5 = @"Select * from book_thema";
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter(selectQuery5, connection);
            adapter.Fill(table);
            dataGridView4.DataSource = table;
            //dataGridView4.Columns[0].HeaderText = "Название группы";
            //dataGridView4.Columns[1].HeaderText = "День недели";
            //dataGridView4.Columns[2].HeaderText = "Номер пары";
            //dataGridView4.Columns[3].HeaderText = "Дисциплина";
            //dataGridView4.Columns[4].HeaderText = "Преподаватель";
            //dataGridView4.Columns[5].HeaderText = "Номер аудитории";
            //dataGridView4.Columns[6].HeaderText = "Начальная неделя";
            //dataGridView4.Columns[7].HeaderText = "Конечная неделя";


            ///////////////////////////////////////////////Для добавления и удаления и изменения аудитории////////////



            ////////////////////////////Список всех преподов////////////

            //string selectQuery115 = @"SELECT teachers.card_num,teachers.experience,teachers.FIO_teacher, department.name_department,post.name_post,degree.name_degree
            //                            FROM teachers
            //                            inner join department on department.id_department = teachers.id_department
            //                            inner join post on post.id_post = teachers.id_post
            //                            inner join degree on degree.id_degree = teachers.id_degree  ";

            string selectQuery115 = @"Select * from reader";
            DataTable table115 = new DataTable();
            MySqlDataAdapter adapter115 = new MySqlDataAdapter(selectQuery115, connection);
            adapter115.Fill(table115);
            dataGridView1.DataSource = table115;
            //dataGridView1.Columns[0].HeaderText = "Номер карты"; 
            //dataGridView1.Columns[1].HeaderText = "Стаж";
            //dataGridView1.Columns[2].HeaderText = "Преподаватель";
            //dataGridView1.Columns[3].HeaderText = "Кафедра";
            //dataGridView1.Columns[4].HeaderText = "Должность";
            //dataGridView1.Columns[5].HeaderText = "Звание";

            //string selectQuery17 = "Select DISTINCT FIO_teacher from teachers";
            //MySqlDataAdapter da17 = new MySqlDataAdapter(selectQuery17, connection);
            //DataSet ds17 = new DataSet();
            //da17.Fill(ds17);
            //comboBox18.DataSource = ds17.Tables[0];
            //comboBox18.DisplayMember = "card_num";
            //comboBox18.ValueMember = "FIO_teacher";

            //string selectQuery18 = "Select DISTINCT name_department from department";
            //MySqlDataAdapter da18 = new MySqlDataAdapter(selectQuery18, connection);
            //DataSet ds18 = new DataSet();
            //da18.Fill(ds18);
            //comboBox17.DataSource = ds18.Tables[0];
            //comboBox17.DisplayMember = "id_department";
            //comboBox17.ValueMember = "name_department";
            //comboBox20.DataSource = ds18.Tables[0];
            //comboBox20.DisplayMember = "id_department";
            //comboBox20.ValueMember = "name_department";
            //comboBox22.DataSource = ds18.Tables[0];
            //comboBox22.DisplayMember = "id_department";
            //comboBox22.ValueMember = "name_department";

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


        }//Подгрузка при запуске!


        private void button4_Click(object sender, EventArgs e)
        {
            Application.Restart();
        }//Перезагрузить приложение!


        private void button14_Click(object sender, EventArgs e)
        {

//                string selectQuery77 = @"SELECT teachers.card_num, teachers.FIO_teacher, department.name_department FROM teachers 
//INNER join department on department.id_department=teachers.id_department
//Where department.name_department='" + comboBox17.SelectedValue.ToString() + "' AND teachers.FIO_teacher='" + comboBox18.SelectedValue.ToString() + "'";
//                DataTable tableay1 = new DataTable();
//                MySqlDataAdapter adapteray1 = new MySqlDataAdapter(selectQuery77, connection);
//                adapteray1.Fill(tableay1);
//                dataGridView2.DataSource = tableay1;
//            dataGridView2.Columns[0].HeaderText = "Номер карты";
//            dataGridView2.Columns[1].HeaderText = "Преподаватель";
//            dataGridView2.Columns[2].HeaderText = "Кафедра";

        }//Поиск преподавателя!

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

