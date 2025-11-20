#!/bin/bash

echo "🚀 Starting Booster Bee Setup..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    echo "📦 Run: pkg install nodejs"
    exit 1
fi

# Check if package.json exists
if [ ! -f "package.json" ]; then
    echo "❌ package.json not found. Please make sure you're in the correct directory."
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully!"
else
    echo "❌ Failed to install dependencies. Please check your internet connection."
    exit 1
fi

# Get local IP address
IP_ADDRESS=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n 1)

echo ""
echo "🎉 Booster Bee is ready to use!"
echo ""
echo "🌐 Access URLs:"
echo "   Local:  http://localhost:3001"
echo "   Network: http://${IP_ADDRESS}:3001"
echo ""
echo "📱 Open your browser and start boosting your website traffic!"
echo ""
echo "🛑 To stop the server, press: Ctrl + C"
echo ""

# Start the server
node server.js
