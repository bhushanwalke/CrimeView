# Setup and Running the application

1. Create and activate a virtual environment inside your project directory: 

2. virtualenv env

3. source env/bin/activate

4. Install the requirements:

5. pip install -r requirements.txt

6. Create the database:
	- python -i demo_model.py
	- db.create_all()

7. Seed data:
	- python demo_seed.py

8. python demo_server.py

9. Navigate to `localhost:5000`

