hi:
    # Hi! Welcome to my hackathon starter kit.
    #
    printf '\033[1;31mHackathon Starter Kit \033[1;34mMK1\033[0m\n'

new:
    ./setup.sh

frontend:
    # starting a container for the frontend at http://localhost:3000
    docker compose up frontend --build
    
backend:
    # starting a container for the backend at http://localhost:8000
    docker compose up backend --build
    
