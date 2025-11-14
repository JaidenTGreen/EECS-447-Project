import sqlite3
import pandas as pd
import streamlit as st
import pathlib

DB_PATH = "EECS447.db"

def get_connection():
    return sqlite3.connect(DB_PATH)

def run_query(sql, params=None):
    if params is None:
        params = ()
    conn = get_connection()

    try:
        stripped = sql.strip().lower()
        if stripped.startswith("select"):
            df = pd.read_sql_query(sql, conn, params=params)
            return df
        else:
            cur = conn.cursor()
            cur.execute(sql, params)
            conn.commit()
            return None
    finally:
        conn.close()

def get_counts():
    queries = {
        "Client":       "SELECT COUNT(*) AS count FROM Client;",
        "Librarians":    "SELECT COUNT(*) AS count FROM Librarian;",
        "Total Users":   "SELECT COUNT(*) AS count FROM LIBUSER;",
        "Items":         "SELECT COUNT(*) AS count FROM Items;",
        "Books":         "SELECT COUNT(*) AS count FROM Books;",
        "Movies":        "SELECT COUNT(*) AS count FROM Movies;",
        "Magazines":     "SELECT COUNT(*) AS count FROM Magazines;",
        "Transactions":  "SELECT COUNT(*) AS count FROM UserTransaction;",
        "Fees":          "SELECT COUNT(*) AS count FROM Fee;",
    }
    data = []
    for label, q in queries.items():
        df = run_query(q)
        data.append({"Relation": label, "Count": int(df["count"].iloc[0])})
    return pd.DataFrame(data)

def load_queries(path="queries.sql"):
    queries = {}
    name = None
    sql_lines = []

    try:
        with open(path, "r", encoding="utf-8") as f:
            for line in f:
                if line.startswith("-- Name:"):
                    if name is not None and sql_lines:
                        queries[name] = "".join(sql_lines).strip()
                        sql_lines = []

                    name = line[len("-- Name:"):].strip()
                else:
                    if name is not None:
                        sql_lines.append(line)

        if name is not None and sql_lines:
            queries[name] = "".join(sql_lines).strip()

    except FileNotFoundError:
        pass

    return queries


def main():
    st.set_page_config(page_title="Library DB Dashboard", layout="wide")
    st.title("Library Database Dashboard")

    # Sidebar
    st.sidebar.header("Controls")

    section = st.sidebar.radio(
        "Select view:",
        ["Overview", "Predefined queries", "Custom SQL"]
    )

    # )verview
    if section == "Overview":
        st.subheader("General Database Stats")

        counts_df = get_counts()
        st.dataframe(counts_df, width='stretch')

        col1, col2, col3 = st.columns(3)
        items_total = counts_df.loc[counts_df["Relation"] == "Items", "Count"].iloc[0]
        trans_total = counts_df.loc[counts_df["Relation"] == "Transactions", "Count"].iloc[0]
        fees_total = counts_df.loc[counts_df["Relation"] == "Fees", "Count"].iloc[0]

        col1.metric("Total Items", items_total)
        col2.metric("Total Transactions", trans_total)
        col3.metric("Total Fees", fees_total)

        st.markdown("### Items Currently Checked Out")
        checked_out = run_query("""
            SELECT 
                i.Title,
                ut.CopyID,
                ut.ClientID,     
                ut.TransactionID,
                ut.CheckoutDate,
                ut.DueDate
            FROM UserTransaction ut
            JOIN Items i ON i.CopyID = ut.CopyID
            WHERE ut.ReturnDate IS NULL;
        """)
        st.dataframe(checked_out, width='stretch')

    # Predefined queries
    elif section == "Predefined queries":
        st.subheader("Predefined Queries")

        queries = load_queries()

        query_name = st.selectbox(
            "Choose a query:",
            list(queries.keys())
        )

        sql = queries[query_name]
        if st.button("Run Query"):
            try:
                df = run_query(sql)
                st.dataframe(df)
            except Exception as e:
                st.error(f"Error running query: {e}")

    # Custom SQL
    else:
        st.subheader("Custom SQL Query")
        sql = st.text_area("Write SQL here:")

        if st.button("Run Query"):
            if not sql.strip():
                st.warning("Please enter a SQL statement.")
            else:
                try:
                    result = run_query(sql)

                    if isinstance(result, pd.DataFrame):
                        st.dataframe(result, width='stretch')
                    else:
                        st.success("Query executed successfully.")
                except Exception as e:
                    st.error(f"Error running query: {e}")

if __name__ == "__main__":
    main()