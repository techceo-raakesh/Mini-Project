import tkinter as tk
from time import strftime
def time():
    current_time = strftime('%H:%M:%S %p')
    label.config(text=current_time)
    label.after(1000,time)
root = tk.Tk()
root.title('Digital Clock')
label = tk.Label(root, font=('Arial', 50, 'bold'), background='black', foreground='cyan')
label.pack(anchor='center')
time()
root.mainloop()
date_label = tk.Label(root,font=('Arial',20),bg='black',fg='white')
date_label.pack()
def update_date():
    date_label.config(text=strftime('%A, %d %B %Y'))
    date_label.after(1000, update_date)
update_date()
