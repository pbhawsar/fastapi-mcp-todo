# FastAPI Todo App - Render Deployment

This guide explains how to deploy the FastAPI Todo application to Render.

## Files Created for Deployment

### 1. `render.yaml`
Main configuration file for Render deployment with:
- **Service Type:** Web service
- **Environment:** Python 3.11
- **Plan:** Free tier
- **Build Command:** `pip install -r requirements.txt`
- **Start Command:** `uvicorn main:app --host 0.0.0.0 --port $PORT`
- **Health Check:** Root path `/`
- **Auto Deploy:** Enabled for main branch

### 2. `.renderignore`
Excludes unnecessary files from deployment:
- Python cache files
- Virtual environments
- IDE files
- OS files
- Git files
- Documentation
- Test files
- Local database files

### 3. `start.sh`
Optional startup script for custom deployment logic.

## Deployment Steps

### Option 1: Using Render Dashboard (Recommended)

1. **Connect Repository:**
   - Go to [Render Dashboard](https://dashboard.render.com)
   - Click "New +" → "Web Service"
   - Connect your GitHub/GitLab repository
   - Select this repository

2. **Configure Service:**
   - **Name:** `fastapi-todo-app` (or your preferred name)
   - **Environment:** `Python 3`
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `uvicorn main:app --host 0.0.0.0 --port $PORT`
   - **Python Version:** `3.11.0`

3. **Deploy:**
   - Click "Create Web Service"
   - Render will automatically build and deploy your app

### Option 2: Using render.yaml (Blueprints)

1. **Push to Repository:**
   ```bash
   git add .
   git commit -m "Add Render deployment configuration"
   git push origin main
   ```

2. **Deploy via Blueprint:**
   - Go to Render Dashboard
   - Click "New +" → "Blueprint"
   - Connect your repository
   - Render will automatically detect `render.yaml`

## Environment Variables

No additional environment variables are required for basic functionality. The app uses:
- **Database:** SQLite (file-based, created automatically)
- **Port:** Automatically assigned by Render (`$PORT`)

## Database

The application uses SQLite with automatic table creation:
- **File:** `todo.db` (created on first run)
- **Tables:** `todos` (auto-created via SQLAlchemy)
- **Persistence:** Data persists between deployments

## API Endpoints

Once deployed, your API will be available at:
- **Base URL:** `https://your-app-name.onrender.com`
- **API Docs:** `https://your-app-name.onrender.com/docs`
- **Health Check:** `https://your-app-name.onrender.com/`

### Available Endpoints:
- `GET /` - Welcome page
- `GET /todos/` - List all todos
- `GET /todos/{id}` - Get specific todo
- `POST /todos/` - Create new todo
- `PUT /todos/{id}` - Update todo
- `DELETE /todos/{id}` - Delete todo

## Monitoring

Render provides:
- **Logs:** Real-time application logs
- **Metrics:** CPU, memory, and response time
- **Health Checks:** Automatic health monitoring
- **Uptime:** Service availability tracking

## Troubleshooting

### Common Issues:

1. **Build Failures:**
   - Check `requirements.txt` for all dependencies
   - Ensure Python version compatibility

2. **Startup Errors:**
   - Verify `uvicorn` command syntax
   - Check port configuration (`$PORT`)

3. **Database Issues:**
   - SQLite file permissions
   - Disk space for database file

### Debug Commands:
```bash
# Check logs in Render dashboard
# Or locally test with:
uvicorn main:app --host 0.0.0.0 --port 8000
```

## Cost

- **Free Tier:** 750 hours/month
- **Database:** Included (SQLite file)
- **Bandwidth:** 100GB/month
- **Sleep:** App sleeps after 15 minutes of inactivity

## Next Steps

After successful deployment:
1. Test all API endpoints
2. Set up monitoring alerts
3. Configure custom domain (if needed)
4. Set up CI/CD for automatic deployments
