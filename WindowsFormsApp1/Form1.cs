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

            string selectQuery6 = "SELECT * FROM audience";
            DataTable tableay = new DataTable();
            MySqlDataAdapter adapteray = new MySqlDataAdapter(selectQuery6, connection);
            adapteray.Fill(tableay);
            dataGridView3.DataSource = tableay;
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

            //string selectQuery101 = "Select DISTINCT number from number_lesson";
            //MySqlDataAdapter da101 = new MySqlDataAdapter(selectQuery101, connection);
            //DataSet ds101 = new DataSet();
            //da101.Fill(ds101);
            //comboBox6.DataSource = ds101.Tables[0];
            //comboBox6.DisplayMember = "id_num";
            //comboBox6.ValueMember = "number";

            ///////////////////////////////////////////////Для добавления и удаления и изменения////////////
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

            //string selectQuery8 = "Select DISTINCT quantity_seats from audience";
            //MySqlDataAdapter da12 = new MySqlDataAdapter(selectQuery8, connection);
            //DataSet ds12 = new DataSet();
            //da12.Fill(ds12);
            //comboBox12.DataSource = ds12.Tables[0];
            //comboBox12.DisplayMember = "number_aud";
            //comboBox12.ValueMember = "quantity_seats";

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

            /////////////////////////////////////////// Для добавления занятия////////////////////

            string selectQuery21 = "Select DISTINCT denNedeli from DataPar";
            MySqlDataAdapter da21 = new MySqlDataAdapter(selectQuery21, connection);
            DataSet ds21 = new DataSet();
            da21.Fill(ds21);
            comboBox7.DataSource = ds21.Tables[0];
            comboBox7.DisplayMember = "id_data";
            comboBox7.ValueMember = "denNedeli";

            string selectQuery22 = "Select DISTINCT nomerPary from DataPar";
            MySqlDataAdapter da22 = new MySqlDataAdapter(selectQuery22, connection);
            DataSet ds22 = new DataSet();
            da22.Fill(ds22);
            comboBox8.DataSource = ds22.Tables[0];
            comboBox8.DisplayMember = "id_data";
            comboBox8.ValueMember = "nomerPary";

            //string selectQuery25 = "Select DISTINCT nedStart from DataPar";
            //MySqlDataAdapter da25 = new MySqlDataAdapter(selectQuery25, connection);
            //DataSet ds25 = new DataSet();
            //da25.Fill(ds25);
            //comboBox9.DataSource = ds25.Tables[0];
            //comboBox9.DisplayMember = "id_data";
            //comboBox9.ValueMember = "nedStart";

            //string selectQuery26 = "Select DISTINCT nedEnd from DataPar";
            //MySqlDataAdapter da26 = new MySqlDataAdapter(selectQuery26, connection);
            //DataSet ds26 = new DataSet();
            //da26.Fill(ds26);
            //comboBox13.DataSource = ds26.Tables[0];
            //comboBox13.DisplayMember = "id_data";
            //comboBox13.ValueMember = "nedEnd";

            string selectQuery23 = "Select DISTINCT nomer from Auditorya";
            MySqlDataAdapter da23 = new MySqlDataAdapter(selectQuery23, connection);
            DataSet ds23 = new DataSet();
            da23.Fill(ds23);
            comboBox11.DataSource = ds23.Tables[0];
            comboBox11.DisplayMember = "id_Aud";
            comboBox11.ValueMember = "nomer";

            string selectQuery24 = "Select DISTINCT FIOpr from Prepodavateli";
            MySqlDataAdapter da24 = new MySqlDataAdapter(selectQuery24, connection);
            DataSet ds24 = new DataSet();
            da24.Fill(ds24);
            comboBox3.DataSource = ds24.Tables[0];
            comboBox3.DisplayMember = "id_Prep";
            comboBox3.ValueMember = "FIOpr";

            string selectQuery27 = "Select DISTINCT name from Grypa";
            MySqlDataAdapter da27 = new MySqlDataAdapter(selectQuery27, connection);
            DataSet ds27 = new DataSet();
            da27.Fill(ds27);
            comboBox10.DataSource = ds27.Tables[0];
            comboBox10.DisplayMember = "id_gr";
            comboBox10.ValueMember = "name";

            string selectQuery28 = "Select nazvanie from Zanatie";
            MySqlDataAdapter da28 = new MySqlDataAdapter(selectQuery28, connection);
            DataSet ds28 = new DataSet();
            da28.Fill(ds28);
            comboBox14.DataSource = ds28.Tables[0];
            comboBox14.DisplayMember = "id_Zanatia";
            comboBox14.ValueMember = "nazvanie";

            string selectQuery29 = "Select  kafedra from Napravlenie";
            MySqlDataAdapter da29 = new MySqlDataAdapter(selectQuery29, connection);
            DataSet ds29 = new DataSet();
            da29.Fill(ds29);
            comboBox15.DataSource = ds29.Tables[0];
            comboBox15.DisplayMember = "id_nap";
            comboBox15.ValueMember = "kafedra";

            ////////////////////////////Список всех преподов////////////

            string selectQuery115 = @"Select * from Prepodavateli ";

            DataTable table115 = new DataTable();
            MySqlDataAdapter adapter115 = new MySqlDataAdapter(selectQuery115, connection);
            adapter115.Fill(table115);
            dataGridView1.DataSource = table115;

            string selectQuery17 = "Select DISTINCT FIOpr from Prepodavateli";
            MySqlDataAdapter da17 = new MySqlDataAdapter(selectQuery17, connection);
            DataSet ds17 = new DataSet();
            da17.Fill(ds17);
            comboBox18.DataSource = ds17.Tables[0];
            comboBox18.DisplayMember = "id_Prep";
            comboBox18.ValueMember = "FIOpr";

            string selectQuery18 = "Select DISTINCT kafedra from Napravlenie";
            MySqlDataAdapter da18 = new MySqlDataAdapter(selectQuery18, connection);
            DataSet ds18 = new DataSet();
            da18.Fill(ds18);
            comboBox17.DataSource = ds18.Tables[0];
            comboBox17.DisplayMember = "id_nap";
            comboBox17.ValueMember = "kafedra";

            string selectQuery19 = "Select DISTINCT doljnost from Prepodavateli";
            MySqlDataAdapter da19 = new MySqlDataAdapter(selectQuery19, connection);
            DataSet ds19 = new DataSet();
            da19.Fill(ds19);
            comboBox16.DataSource = ds19.Tables[0];
            comboBox16.DisplayMember = "id_Prep";
            comboBox16.ValueMember = "doljnost";

            comboBox9.DataSource = ds19.Tables[0];
            comboBox9.DisplayMember = "id_Prep";
            comboBox9.ValueMember = "doljnost";

            ///////////////////////////////////////////////Изменить занятие////////////
            string selectQuery116 = @"Select * from Raspis ";

            DataTable table116 = new DataTable();
            MySqlDataAdapter adapter116 = new MySqlDataAdapter(selectQuery116, connection);
            adapter116.Fill(table116);
            dataGridView6.DataSource = table116;

        }//Подгрузка при запуске

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
where day_week.name_day = '" + denned + "' and number_lesson.number = '" + nompar + "' and '" + ned + "' between number_lesson.week_start and number_lesson.week_end)";


                //выводитлишние аудитории

                //where DataPar.denNedeli = '" + denned + "' and DataPar.nomerPary = '" + nompar + "'";
                DataTable tableay1 = new DataTable();
                MySqlDataAdapter adapteray1 = new MySqlDataAdapter(selectQuery7, connection);
                adapteray1.Fill(tableay1);
                dataGridView5.DataSource = tableay1;
            }

        }//Поиск свободных аудиторий

        private void button4_Click(object sender, EventArgs e)
        {
            Application.Restart();
        }//Перезагрузить приложение

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
        }//Добавить аудиторию

        private void button6_Click(object sender, EventArgs e)
        {
            string yda = comboBox12.Text;

            string selectQuery14 = "DELETE FROM audience where number_aud = '" + yda + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery14, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Аудитория удалена!");
        }//Удалить аудиторию

        private void button7_Click(object sender, EventArgs e)
        {
            string num = comboBox13.Text;
            int kolvom2 = Convert.ToInt32(textBox3.Text);
            string dept = comboBox1.Text;


            string selectQuery13 = "UPDATE audience SET quantity_seats='" + kolvom2 + "', housing='" + comboBox1.SelectedValue.ToString() + "' WHERE number_aud='" + num + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Данные изменены!");
        }//Изменение аудитории

        private void button1_Click(object sender, EventArgs e)
        {
            string denned = Convert.ToString(comboBox7.Items[comboBox7.SelectedIndex]);
            string nompar = Convert.ToString(comboBox8.Items[comboBox8.SelectedIndex]);
           // string denned = Convert.ToString(textBox3.Text);
           // int nompar = Convert.ToInt32(textBox4.Text);

            int nachned = Convert.ToInt32(textBox1.Text);
            int konned = Convert.ToInt32(textBox2.Text);

            string nomay = Convert.ToString(comboBox11.Items[comboBox11.SelectedIndex]);

            string gryp = Convert.ToString(comboBox10.Items[comboBox10.SelectedIndex]);
            string prep = Convert.ToString(comboBox3.Items[comboBox3.SelectedIndex]);
            string zan = Convert.ToString(comboBox14.Items[comboBox14.SelectedIndex]);
            string kaf = Convert.ToString(comboBox15.Items[comboBox15.SelectedIndex]);

            //добавление даты в таблицу дат
            string selectQuery13 = "INSERT INTO DataPar(denNedeli, nomerPary, nedStart, nedEnd) VALUES ('" + comboBox7.SelectedValue.ToString() + "','" + comboBox8.SelectedValue.ToString() + "','" + nachned + "','" + konned + "')";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
           connection.Open();
            da13.ExecuteNonQuery();
            //MessageBox.Show("Данные добавлены!");

            //вывод даты если совпало с выбраными
            string selectQuery140 = "Select DISTINCT id_data from DataPar where denNedeli='" + comboBox7.SelectedValue.ToString() + "' and nomerPary='" + comboBox8.SelectedValue.ToString() + "' and nedStart='" + nachned + "' and nedEnd ='" + konned + "'";
            MySqlCommand da140 = new MySqlCommand(selectQuery140, connection);
            da140.ExecuteNonQuery();
            string name140 = da140.ExecuteScalar().ToString();


            //предмет
            string selectQuery141 = "Select DISTINCT id_Zanatia from Zanatie where Zanatie.nazvanie='" + comboBox14.SelectedValue.ToString() + "'";
            MySqlCommand da141 = new MySqlCommand(selectQuery141, connection);
            da141.ExecuteNonQuery();
            string name141 = da141.ExecuteScalar().ToString();


            //препод
            string selectQuery142 = "Select DISTINCT id_Prep from Prepodavateli where Prepodavateli.FIOpr='" + comboBox3.SelectedValue.ToString() + "'";
            MySqlCommand da142 = new MySqlCommand(selectQuery142, connection);
            da142.ExecuteNonQuery();
            string name142 = da142.ExecuteScalar().ToString();


            //аудитория
            string selectQuery143 = "Select DISTINCT id_Aud from Auditorya where  Auditorya.nomer='" + comboBox11.SelectedValue.ToString() + "'";
            MySqlCommand da143 = new MySqlCommand(selectQuery143, connection);
            da143.ExecuteNonQuery();
            string name143 = da143.ExecuteScalar().ToString();


            //группа
            string selectQuery144 = "Select DISTINCT id_gr from Grypa where Grypa.name='" + comboBox10.SelectedValue.ToString() + "'";
            MySqlCommand da144 = new MySqlCommand(selectQuery144, connection);
            da144.ExecuteNonQuery();
            string name144 = da144.ExecuteScalar().ToString();


            //направление
            string selectQuery145 = "Select DISTINCT id_nap from Napravlenie where Napravlenie.kafedra='" + comboBox15.SelectedValue.ToString() + "' ";
            MySqlCommand da145 = new MySqlCommand(selectQuery145, connection);
            da145.ExecuteNonQuery();
            string name145 = da145.ExecuteScalar().ToString();
            //MessageBox.Show(name);

            string selectQuery15 = "INSERT INTO Raspis(id_data, id_Zanatia, id_Prep, id_Aud, id_gr, id_nap) VALUES ('" + name140 + "','" + name141 + "','" + name142 + "','" + name143 + "','" + name144 + "','" + name145 + "')";
            MySqlCommand da14 = new MySqlCommand(selectQuery15, connection);
            //connection.Open();
            da14.ExecuteNonQuery();
            MessageBox.Show("Занятие добавлено!");
            
        }//Добавить занятие

        private void button14_Click(object sender, EventArgs e)
        {
            string FIOpr = Convert.ToString(comboBox18.Items[comboBox18.SelectedIndex]);
            string kaf = Convert.ToString(comboBox17.Items[comboBox17.SelectedIndex]);

            if (FIOpr != null && kaf != null )
            {
                string selectQuery77 = @"Select FIOpr, doljnost from Prepodavateli where FIOpr = '" + comboBox18.SelectedValue.ToString() + "'";
                DataTable tableay1 = new DataTable();
                MySqlDataAdapter adapteray1 = new MySqlDataAdapter(selectQuery77, connection);
                adapteray1.Fill(tableay1);
                dataGridView2.DataSource = tableay1;
            }
        }//Поиск преподавателя

        private void button13_Click(object sender, EventArgs e)
        {
            string fiop = Convert.ToString(textBox12.Text);
            string nomy = Convert.ToString(textBox11.Text);
            string staj = Convert.ToString(textBox15.Text);

            string selectQuery13 = "INSERT INTO Prepodavateli(FIOpr, nomerUdostov, doljnost, staj) VALUES ('" + fiop + "','" + nomy + "','" + comboBox16.SelectedValue.ToString() + "','" + staj + "')";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Преподаватель добавлен!");
        }//Добавить нового препода

        private void button11_Click(object sender, EventArgs e)
        {
            string fiop = Convert.ToString(textBox10.Text);
            string nomy = Convert.ToString(textBox9.Text);
            string staj = Convert.ToString(textBox16.Text);
            string prid = Convert.ToString(textBox8.Text);

            string selectQuery13 = "UPDATE Prepodavateli SET FIOpr='" + fiop + "', nomerUdostov='" + nomy + "', doljnost='" + comboBox9.SelectedValue.ToString() + "', staj='" + staj + "' WHERE id_Prep='" + prid + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Данные изменены!");
        }//Изменить данные о преподе

        private void button12_Click(object sender, EventArgs e)
        {
            string fiop = Convert.ToString(textBox14.Text);
            string nomy = Convert.ToString(textBox13.Text);

            string selectQuery14 = "DELETE FROM Prepodavateli where FIOpr = '" + fiop + "' and id_Prep='"+nomy+"'";
            MySqlCommand da13 = new MySqlCommand(selectQuery14, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Преподаватель удален!");
        }//Уволить препода

        private void button9_Click(object sender, EventArgs e)
        {
            string data = Convert.ToString(textBox17.Text);
            string zanat = Convert.ToString(textBox18.Text);
            string prep = Convert.ToString(textBox19.Text);
            string aud = Convert.ToString(textBox20.Text);
            string gr = Convert.ToString(textBox21.Text);
            string nap = Convert.ToString(textBox22.Text);
            string zap = Convert.ToString(textBox23.Text);

            string selectQuery13 = "UPDATE Raspis SET id_data='" + data + "', id_Zanatia='" + zanat + "', id_Prep='" + prep + "', id_Aud='" + aud + "' , id_gr='" + gr + "', id_nap='" + nap + "' WHERE id_zap='" + zap + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Данные изменены!");
        }//Изменить пункт расписания (занятие)

        private void button19_Click(object sender, EventArgs e)
        {
            string fiop = Convert.ToString(textBox24.Text);

            string selectQuery14 = "DELETE FROM Raspis where id_zap = '" + fiop + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery14, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Преподаватель удален!");
        }//Удалить занятие

    }
}

//чтоб изменять занятие не по айди а по выпад спискам
