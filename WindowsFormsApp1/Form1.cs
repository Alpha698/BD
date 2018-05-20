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
        MySqlConnection connection = new MySqlConnection("server=localhost;port=3306; Initial Catalog='Practical_classes';username=root;password=;SslMode=none");
        private void Form1_Load(object sender, EventArgs e)
        {
            string selectQuery5 = @"Select study_group.name_group, day_week.name_day, number_lesson.number, discipline.name_discipline, teachers.FIO_teacher, audience.number_aud, number_lesson.week_start, number_lesson.week_end
                                    from  discipline, sschedule
                                    inner join study_group on study_group.id_group = sschedule.id_group 
                                    inner join audience on audience.number_aud = sschedule.number_aud
                                    inner join teachers on teachers.card_num = sschedule.card_num                
                                    inner join day_week on day_week.id_day = sschedule.id_day 
                                    inner join type_occupation on type_occupation.id_type = sschedule.id_type
                                    inner join number_lesson on number_lesson.id_num = sschedule.id_num
                                    WHERE study_group.id_specialty IN (Select id_specialty from specialty
                                                                        where  discipline.id_discipline = specialty.id_discipline)";

            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter(selectQuery5, connection);
            adapter.Fill(table);
            dataGridView4.DataSource = table;
            dataGridView4.Columns[0].HeaderText = "Название группы";
            dataGridView4.Columns[1].HeaderText = "День недели";
            dataGridView4.Columns[2].HeaderText = "Номер пары";
            dataGridView4.Columns[3].HeaderText = "Дисциплина";
            dataGridView4.Columns[4].HeaderText = "Преподаватель";
            dataGridView4.Columns[5].HeaderText = "Номер аудитории";
            dataGridView4.Columns[6].HeaderText = "Начальная неделя";
            dataGridView4.Columns[7].HeaderText = "Конечная неделя";

            string selectQuery6 = "SELECT * FROM audience";
            DataTable tableay = new DataTable();
            MySqlDataAdapter adapteray = new MySqlDataAdapter(selectQuery6, connection);
            adapteray.Fill(tableay);
            dataGridView3.DataSource = tableay;
            dataGridView3.Columns[0].HeaderText = "Номер аудитории"; dataGridView3.Columns[0].MinimumWidth = 120;
            dataGridView3.Columns[1].HeaderText = "Кол-во мест";
            dataGridView3.Columns[2].HeaderText = "Корпус"; dataGridView3.Columns[2].MinimumWidth = 125;

            //////////////////////////////////////////////////Для выбора своб аудитории////////////
            string selectQuery9 = "Select DISTINCT name_day from day_week";
            MySqlDataAdapter da9 = new MySqlDataAdapter(selectQuery9, connection);
            DataSet ds9 = new DataSet();
            da9.Fill(ds9);
            comboBox4.DataSource = ds9.Tables[0];
            comboBox4.DisplayMember = "id_day";
            comboBox4.ValueMember = "name_day";

            string selectQuery10 = "Select DISTINCT number from number_lesson";
            MySqlDataAdapter da10 = new MySqlDataAdapter(selectQuery10, connection);
            DataSet ds10 = new DataSet();
            da10.Fill(ds10);
            comboBox5.DataSource = ds10.Tables[0];
            comboBox5.DisplayMember = "id_num";
            comboBox5.ValueMember = "number";

            ///////////////////////////////////////////////Для добавления и удаления и изменения аудитории////////////
            string selectQuery7 = "Select DISTINCT number_aud from audience";
            MySqlDataAdapter da = new MySqlDataAdapter(selectQuery7, connection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            comboBox13.DataSource = ds.Tables[0];
            comboBox13.DisplayMember = "number_aud";
            comboBox13.ValueMember = "number_aud";
            comboBox12.DataSource = ds.Tables[0];
            comboBox12.DisplayMember = "number_aud";
            comboBox12.ValueMember = "number_aud";

            string selectQuery71 = "Select DISTINCT housing from audience";
            MySqlDataAdapter da3 = new MySqlDataAdapter(selectQuery71, connection);
            DataSet ds3 = new DataSet();
            da3.Fill(ds3);
            comboBox2.DataSource = ds3.Tables[0];
            comboBox2.DisplayMember = "number_aud";
            comboBox2.ValueMember = "housing";
            comboBox1.DataSource = ds3.Tables[0];
            comboBox1.DisplayMember = "number_aud";
            comboBox1.ValueMember = "housing";

            ////////////////////////////Список всех преподов////////////

            string selectQuery115 = @"SELECT teachers.card_num,teachers.experience,teachers.FIO_teacher, department.name_department,post.name_post,degree.name_degree
                                        FROM teachers
                                        inner join department on department.id_department = teachers.id_department
                                        inner join post on post.id_post = teachers.id_post
                                        inner join degree on degree.id_degree = teachers.id_degree  ";
            DataTable table115 = new DataTable();
            MySqlDataAdapter adapter115 = new MySqlDataAdapter(selectQuery115, connection);
            adapter115.Fill(table115);
            dataGridView1.DataSource = table115;
            dataGridView1.Columns[0].HeaderText = "Номер карты"; 
            dataGridView1.Columns[1].HeaderText = "Стаж";
            dataGridView1.Columns[2].HeaderText = "Преподаватель";
            dataGridView1.Columns[3].HeaderText = "Кафедра";
            dataGridView1.Columns[4].HeaderText = "Должность";
            dataGridView1.Columns[5].HeaderText = "Звание";

            string selectQuery17 = "Select DISTINCT FIO_teacher from teachers";
            MySqlDataAdapter da17 = new MySqlDataAdapter(selectQuery17, connection);
            DataSet ds17 = new DataSet();
            da17.Fill(ds17);
            comboBox18.DataSource = ds17.Tables[0];
            comboBox18.DisplayMember = "card_num";
            comboBox18.ValueMember = "FIO_teacher";

            string selectQuery18 = "Select DISTINCT name_department from department";
            MySqlDataAdapter da18 = new MySqlDataAdapter(selectQuery18, connection);
            DataSet ds18 = new DataSet();
            da18.Fill(ds18);
            comboBox17.DataSource = ds18.Tables[0];
            comboBox17.DisplayMember = "id_department";
            comboBox17.ValueMember = "name_department";
            comboBox20.DataSource = ds18.Tables[0];
            comboBox20.DisplayMember = "id_department";
            comboBox20.ValueMember = "name_department";
            comboBox22.DataSource = ds18.Tables[0];
            comboBox22.DisplayMember = "id_department";
            comboBox22.ValueMember = "name_department";

            string selectQuery19 = "Select DISTINCT name_post from post";
            MySqlDataAdapter da19 = new MySqlDataAdapter(selectQuery19, connection);
            DataSet ds19 = new DataSet();
            da19.Fill(ds19);
            comboBox16.DataSource = ds19.Tables[0];
            comboBox16.DisplayMember = "id_post";
            comboBox16.ValueMember = "name_post";
            comboBox9.DataSource = ds19.Tables[0];
            comboBox9.DisplayMember = "id_post";
            comboBox9.ValueMember = "name_post";

            string selectQuery199 = "Select DISTINCT name_degree from degree";
            MySqlDataAdapter da199 = new MySqlDataAdapter(selectQuery199, connection);
            DataSet ds199 = new DataSet();
            da199.Fill(ds199);
            comboBox19.DataSource = ds199.Tables[0];
            comboBox19.DisplayMember = "id_degree";
            comboBox19.ValueMember = "name_degree";
            comboBox23.DataSource = ds199.Tables[0];
            comboBox23.DisplayMember = "id_degree";
            comboBox23.ValueMember = "name_degree";

            string selectQuery21 = "Select DISTINCT card_num from teachers";
            MySqlDataAdapter da21 = new MySqlDataAdapter(selectQuery21, connection);
            DataSet ds21 = new DataSet();
            da21.Fill(ds21);
            comboBox21.DataSource = ds21.Tables[0];
            comboBox21.DisplayMember = "card_num";
            comboBox21.ValueMember = "card_num";
            comboBox24.DataSource = ds21.Tables[0];
            comboBox24.DisplayMember = "card_num";
            comboBox24.ValueMember = "card_num";

            //string id_pr = Convert.ToString(comboBox21.Items[comboBox21.SelectedIndex]);
            //int id_prep = Convert.ToInt32(id_pr);
            //if (id_prep ) { }

            /////////////////////////////////////////// Для добавления занятия////////////////////

            string selectQuery116 = @"Select study_group.name_group, day_week.name_day, number_lesson.number, discipline.name_discipline, teachers.FIO_teacher, audience.number_aud, number_lesson.week_start, number_lesson.week_end
                                    from  discipline, sschedule
                                    inner join study_group on study_group.id_group = sschedule.id_group 
                                    inner join audience on audience.number_aud = sschedule.number_aud
                                    inner join teachers on teachers.card_num = sschedule.card_num                
                                    inner join day_week on day_week.id_day = sschedule.id_day 
                                    inner join type_occupation on type_occupation.id_type = sschedule.id_type
                                    inner join number_lesson on number_lesson.id_num = sschedule.id_num
                                    WHERE study_group.id_specialty IN (Select id_specialty from specialty
                                                                        where  discipline.id_discipline = specialty.id_discipline)";

            DataTable table116 = new DataTable();
            MySqlDataAdapter adapter116 = new MySqlDataAdapter(selectQuery116, connection);
            adapter116.Fill(table116);
            dataGridView6.DataSource = table116;
            dataGridView6.Columns[0].HeaderText = "Название группы";
            dataGridView6.Columns[1].HeaderText = "День недели";
            dataGridView6.Columns[2].HeaderText = "Номер пары";
            dataGridView6.Columns[3].HeaderText = "Дисциплина";
            dataGridView6.Columns[4].HeaderText = "Преподаватель";
            dataGridView6.Columns[5].HeaderText = "Номер аудитории";
            dataGridView6.Columns[6].HeaderText = "Начальная неделя";
            dataGridView6.Columns[7].HeaderText = "Конечная неделя";

            string selectQuery28 = "Select name_discipline from discipline";
            MySqlDataAdapter da28 = new MySqlDataAdapter(selectQuery28, connection);
            DataSet ds28 = new DataSet();
            da28.Fill(ds28);
            comboBox14.DataSource = ds28.Tables[0];
            comboBox14.DisplayMember = "id_discipline";
            comboBox14.ValueMember = "name_discipline";

            string selectQuery27 = "Select DISTINCT name_group from study_group";
            MySqlDataAdapter da27 = new MySqlDataAdapter(selectQuery27, connection);
            DataSet ds27 = new DataSet();
            da27.Fill(ds27);
            comboBox10.DataSource = ds27.Tables[0];
            comboBox10.DisplayMember = "id_group";
            comboBox10.ValueMember = "name_group";

            string selectQuery77 = "Select DISTINCT number_aud from audience";
            MySqlDataAdapter da77 = new MySqlDataAdapter(selectQuery77, connection);
            DataSet ds77 = new DataSet();
            da77.Fill(ds77);
            comboBox11.DataSource = ds77.Tables[0];
            comboBox11.DisplayMember = "number_aud";
            comboBox11.ValueMember = "number_aud";

            string selectQuery212 = "Select DISTINCT name_day from day_week";
            MySqlDataAdapter da212 = new MySqlDataAdapter(selectQuery212, connection);
            DataSet ds212 = new DataSet();
            da212.Fill(ds212);
            comboBox7.DataSource = ds212.Tables[0];
            comboBox7.DisplayMember = "id_day";
            comboBox7.ValueMember = "name_day";

            string selectQuery29 = "Select name_type from type_occupation";
            MySqlDataAdapter da29 = new MySqlDataAdapter(selectQuery29, connection);
            DataSet ds29 = new DataSet();
            da29.Fill(ds29);
            comboBox25.DataSource = ds29.Tables[0];
            comboBox25.DisplayMember = "id_type";
            comboBox25.ValueMember = "name_type";

            string selectQuery147 = "Select DISTINCT FIO_teacher from teachers";
            MySqlDataAdapter da147 = new MySqlDataAdapter(selectQuery147, connection);
            DataSet ds147 = new DataSet();
            da147.Fill(ds147);
            comboBox3.DataSource = ds147.Tables[0];
            comboBox3.DisplayMember = "card_num";
            comboBox3.ValueMember = "FIO_teacher";

            ///////////////////////////////////////////////Изменить занятие////////////


        }//Подгрузка при запуске!

        private void button5_Click(object sender, EventArgs e)
        {

            string denned = Convert.ToString(comboBox4.Items[comboBox4.SelectedIndex]);
            string nompar = Convert.ToString(comboBox5.Items[comboBox5.SelectedIndex]);
            string ned = Convert.ToString(comboBox6.Items[comboBox6.SelectedIndex]);

            if (denned != null && nompar != null && ned != null)
            {
                
                string selectQuery7 = @"Select DISTINCT audience.number_aud, audience.housing from sschedule
inner join day_week on day_week.id_day = sschedule.id_day
inner join number_lesson on number_lesson.id_num = sschedule.id_num
inner join audience on audience.number_aud = sschedule.number_aud WHERE audience.number_aud NOT IN(Select audience.number_aud from sschedule
inner join day_week on day_week.id_day = sschedule.id_day
inner join number_lesson on number_lesson.id_num = sschedule.id_num
inner join audience on audience.number_aud = sschedule.number_aud
where day_week.name_day = '" + comboBox4.SelectedValue.ToString() + "' and number_lesson.number = '" + comboBox5.SelectedValue.ToString() + "' and '" + ned + "' between number_lesson.week_start and number_lesson.week_end)";
                
                //выводитлишние аудитории

                //where DataPar.denNedeli = '" + denned + "' and DataPar.nomerPary = '" + nompar + "'";
                DataTable tableay1 = new DataTable();
                MySqlDataAdapter adapteray1 = new MySqlDataAdapter(selectQuery7, connection);
                adapteray1.Fill(tableay1);
                dataGridView5.DataSource = tableay1;
                dataGridView5.Columns[0].HeaderText = "Номер аудитории"; 
                dataGridView5.Columns[1].HeaderText = "Корпус"; dataGridView5.Columns[1].MinimumWidth = 125;

            } else
            {
                MessageBox.Show("Данные заданы не корректно");
            }

        }//Поиск свободных аудиторий!

        private void button4_Click(object sender, EventArgs e)
        {
            Application.Restart();
        }//Перезагрузить приложение!

        private void button3_Click(object sender, EventArgs e)
        {            

            int nomayd = Convert.ToInt32(textBox5.Text);
            int kolvom = Convert.ToInt32(textBox6.Text);
           // string korpys = Convert.ToString(comboBox2.Items[comboBox2.SelectedIndex]);
            string dept = comboBox2.Text;
            //int etaj = Convert.ToInt32(textBox4.Text);
            //int don = Convert.ToInt32(textBox6.Text);
            //string facult = textBox7.Text;
            //string spets = textBox8.Text;
            //int group = Convert.ToInt32(textBox9.Text);
            //bool status = checkBox1.Checked;

            string selectQuery13 = "INSERT INTO audience(number_aud, quantity_seats, housing) VALUES ('" + nomayd + "','" + kolvom + "','" + dept + "')";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Аудитория добавлена!");
        }//Добавить аудиторию!

        private void button6_Click(object sender, EventArgs e)
        {
            string yda = comboBox12.Text;

            string selectQuery14 = "DELETE FROM audience where number_aud = '" + yda + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery14, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Аудитория удалена!");
        }//Удалить аудиторию!

        private void button7_Click(object sender, EventArgs e)
        {
            int kolvom2 = Convert.ToInt32(textBox3.Text);
          
            string selectQuery13 = "UPDATE audience SET quantity_seats='" + kolvom2 + "', housing='" + comboBox1.SelectedValue.ToString() + "' WHERE number_aud='" + comboBox13.SelectedValue.ToString() + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Аудитория изменена!");
        }//Изменение аудитории!

        private void button1_Click(object sender, EventArgs e)
        {
            int nompar = Convert.ToInt32(textBox4.Text);
            int nachned = Convert.ToInt32(textBox1.Text);
            int konned = Convert.ToInt32(textBox2.Text);

            string nomay = Convert.ToString(comboBox11.Items[comboBox11.SelectedIndex]);
            string gryp = Convert.ToString(comboBox10.Items[comboBox10.SelectedIndex]);
            string prep = Convert.ToString(comboBox3.Items[comboBox3.SelectedIndex]);
            string zan = Convert.ToString(comboBox14.Items[comboBox14.SelectedIndex]);

            string selectQuery13 = "INSERT INTO number_lesson(number,week_start,week_end) VALUES('"+ nompar + "','"+ nachned + "','"+ konned + "')";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();

            string selectQuery133 = "INSERT INTO sschedule (id_schedule, id_group, number_aud, id_day, id_type, id_num, card_num) VALUES ('', (SELECT id_group FROM study_group where  name_group LIKE '" + comboBox10.SelectedValue.ToString() + "' LIMIT 1), '" + comboBox11.SelectedValue.ToString() + "',(SELECT id_day FROM day_week where name_day = '" + comboBox7.SelectedValue.ToString() + "'), (SELECT id_type FROM type_occupation where name_type = '" + comboBox25.SelectedValue.ToString() + "'), (SELECT id_num FROM number_lesson where number = '" + nompar + "' AND week_start='" + nachned + "' AND week_end='" + konned + "'), (SELECT card_num FROM teachers where FIO_teacher = '" + comboBox3.SelectedValue.ToString() + "'));";
            MySqlCommand da133 = new MySqlCommand(selectQuery133, connection);
            da133.ExecuteNonQuery();
            MessageBox.Show("Данные добавлены!");

            ////добавление даты в таблицу дат
            //string selectQuery13 = "INSERT INTO DataPar(denNedeli, nomerPary, nedStart, nedEnd) VALUES ('" + comboBox7.SelectedValue.ToString() + "','" + comboBox8.SelectedValue.ToString() + "','" + nachned + "','" + konned + "')";
            //MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            //connection.Open();
            //da13.ExecuteNonQuery();
            ////MessageBox.Show("Данные добавлены!");

            ////вывод даты если совпало с выбраными
            //string selectQuery140 = "Select DISTINCT id_data from DataPar where denNedeli='" + comboBox7.SelectedValue.ToString() + "' and nomerPary='" + comboBox8.SelectedValue.ToString() + "' and nedStart='" + nachned + "' and nedEnd ='" + konned + "'";
            //MySqlCommand da140 = new MySqlCommand(selectQuery140, connection);
            //da140.ExecuteNonQuery();
            //string name140 = da140.ExecuteScalar().ToString();

            ////предмет
            //string selectQuery141 = "Select DISTINCT id_Zanatia from Zanatie where Zanatie.nazvanie='" + comboBox14.SelectedValue.ToString() + "'";
            //MySqlCommand da141 = new MySqlCommand(selectQuery141, connection);
            //da141.ExecuteNonQuery();
            //string name141 = da141.ExecuteScalar().ToString();

            ////препод
            //string selectQuery142 = "Select DISTINCT id_Prep from Prepodavateli where Prepodavateli.FIOpr='" + comboBox3.SelectedValue.ToString() + "'";
            //MySqlCommand da142 = new MySqlCommand(selectQuery142, connection);
            //da142.ExecuteNonQuery();
            //string name142 = da142.ExecuteScalar().ToString();

            ////аудитория
            //string selectQuery143 = "Select DISTINCT id_Aud from Auditorya where  Auditorya.nomer='" + comboBox11.SelectedValue.ToString() + "'";
            //MySqlCommand da143 = new MySqlCommand(selectQuery143, connection);
            //da143.ExecuteNonQuery();
            //string name143 = da143.ExecuteScalar().ToString();

            ////группа
            //string selectQuery144 = "Select DISTINCT id_gr from Grypa where Grypa.name='" + comboBox10.SelectedValue.ToString() + "'";
            //MySqlCommand da144 = new MySqlCommand(selectQuery144, connection);
            //da144.ExecuteNonQuery();
            //string name144 = da144.ExecuteScalar().ToString();

            //string selectQuery15 = "INSERT INTO Raspis(id_data, id_Zanatia, id_Prep, id_Aud, id_gr, id_nap) VALUES ('" + name140 + "','" + name141 + "','" + name142 + "','" + name143 + "','" + name144 + "','" + name145 + "')";
            //MySqlCommand da14 = new MySqlCommand(selectQuery15, connection);
            ////connection.Open();
            //da14.ExecuteNonQuery();
            //MessageBox.Show("Занятие добавлено!");

        }//Добавить занятие!-

        private void button14_Click(object sender, EventArgs e)
        {

                string selectQuery77 = @"SELECT teachers.card_num, teachers.FIO_teacher, department.name_department FROM teachers 
INNER join department on department.id_department=teachers.id_department
Where department.name_department='" + comboBox17.SelectedValue.ToString() + "' AND teachers.FIO_teacher='" + comboBox18.SelectedValue.ToString() + "'";
                DataTable tableay1 = new DataTable();
                MySqlDataAdapter adapteray1 = new MySqlDataAdapter(selectQuery77, connection);
                adapteray1.Fill(tableay1);
                dataGridView2.DataSource = tableay1;
            dataGridView2.Columns[0].HeaderText = "Номер карты";
            dataGridView2.Columns[1].HeaderText = "Преподаватель";
            dataGridView2.Columns[2].HeaderText = "Кафедра";

        }//Поиск преподавателя!

        private void button13_Click(object sender, EventArgs e)
        {
            string nomy = Convert.ToString(textBox11.Text);
            string staj = Convert.ToString(textBox15.Text);
            string fiop = Convert.ToString(textBox12.Text);
 

            string selectQuery13t = "INSERT INTO teachers(card_num, experience, FIO_teacher, id_department, id_post, id_degree) VALUES ('" + nomy + "','" + staj +"','"+ fiop + "',(SELECT id_department FROM department where name_department = '"+ comboBox20.SelectedValue.ToString() + "'), (SELECT id_post FROM post where name_post = '"+ comboBox16.SelectedValue.ToString() + "'), (SELECT id_degree FROM degree where name_degree = '"+ comboBox19.SelectedValue.ToString() + "') )";
            MySqlCommand da13 = new MySqlCommand(selectQuery13t, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Преподаватель добавлен!");

        }//Добавить нового препода!

        private void button11_Click(object sender, EventArgs e)
        {
            string fiop = Convert.ToString(textBox10.Text);
            string staj = Convert.ToString(textBox16.Text);

            string selectQuery13 = "UPDATE teachers SET card_num='" + comboBox21.SelectedValue.ToString() + "', experience='" + staj+"', FIO_teacher='" + fiop + "', id_department=(SELECT id_department FROM department where name_department = '" + comboBox22.SelectedValue.ToString() + "'), id_post=(SELECT id_post FROM post where name_post = '" + comboBox9.SelectedValue.ToString() + "'),id_degree=(SELECT id_degree FROM degree where name_degree = '" + comboBox23.SelectedValue.ToString() + "') WHERE card_num='" + comboBox21.SelectedValue.ToString() + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Данные изменены!");
        }//Изменить данные о преподе!

        private void button12_Click(object sender, EventArgs e)
        {
            string fiop = Convert.ToString(textBox14.Text);
 
            string selectQuery14 = "DELETE FROM teachers where card_num = '" + comboBox24.SelectedValue.ToString() + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery14, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Преподаватель удален!");
        }//Уволить препода!

        private void button9_Click(object sender, EventArgs e)
        {
            //string data = Convert.ToString(textBox17.Text);
            //string zanat = Convert.ToString(textBox18.Text);
            //string prep = Convert.ToString(textBox19.Text);
            //string aud = Convert.ToString(textBox20.Text);
            //string gr = Convert.ToString(textBox21.Text);
            //string nap = Convert.ToString(textBox22.Text);
            //string zap = Convert.ToString(textBox23.Text);

            //string selectQuery13 = "UPDATE Raspis SET id_data='" + data + "', id_Zanatia='" + zanat + "', id_Prep='" + prep + "', id_Aud='" + aud + "' , id_gr='" + gr + "', id_nap='" + nap + "' WHERE id_zap='" + zap + "'";
            //MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            //connection.Open();
            //da13.ExecuteNonQuery();
            //MessageBox.Show("Данные изменены!");


            //из-за способа хранения занятий, необходимо найти по всем полям такую запись(проверить)
            //вставить новые значения в другие таблицы и записать в расписание ссылки

        }//Изменить пункт расписания (занятие)

        //private void button19_Click(object sender, EventArgs e)
        //{
        //    string fiop = Convert.ToString(textBox24.Text);

        //    string selectQuery14 = "DELETE FROM Raspis where id_zap = '" + fiop + "'";
        //    MySqlCommand da13 = new MySqlCommand(selectQuery14, connection);
        //    connection.Open();
        //    da13.ExecuteNonQuery();
        //    MessageBox.Show("Преподаватель удален!");
        //}//Удалить занятие

    }
}

//чтоб изменять занятие не по айди а по выпад спискам
