## How to use the Library Database

### 1. Set up the database from scratch

1. Open VS Code with the SQLite extension.
2. Run all queries in `EECS447.sql`
    - This creates all the tables, relationships, and constraints.
3. Run all queries in `data_pop.sql`
    - This populates the database with sample data.

At this point, the database schema is created and fully populated.

After these initial steps, you can update or extend the data using the dashboard application in the "Custom SQL" section.

---

### 2. Run the dashboard application

Make sure you have Python installed, then in the project folder run:
```bash
pip install pandas streamlit
streamlit run app.py
```
This will automatically open the application in the default browser.