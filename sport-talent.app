echo created by Digi Daktari
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sports & Talent Scout</title>
    <!-- Load Tailwind CSS for modern styling -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #ecfdf5; /* Light green background */
        }
        .talent-card {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .scout-btn {
            transition: all 0.2s ease;
            transform-origin: center;
        }
        .scout-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(59, 130, 246, 0.4);
        }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen p-4">

    <!-- Main Container -->
    <div class="w-full max-w-lg bg-white talent-card rounded-xl p-8 md:p-10">
        <h1 class="text-3xl font-extrabold text-center text-gray-800 mb-2">Sports Talent Scout</h1>
        <p class="text-center text-gray-500 mb-8">Discover potential sports based on key physical talents.</p>
        
        <!-- Input & Action Button -->
        <div class="flex flex-col items-center space-y-4">
            <button 
                id="scout-button" 
                onclick="generateTalentMatch()" 
                class="scout-btn w-full px-6 py-3 bg-blue-600 text-white font-semibold rounded-lg shadow-lg focus:outline-none focus:ring-4 focus:ring-blue-300">
                Scout a New Talent
            </button>
        </div>

        <!-- Result Display Area -->
        <div id="result-area" class="mt-8 p-6 bg-gray-50 rounded-lg border-l-4 border-blue-500 hidden">
            <h2 class="text-xl font-bold text-gray-800 mb-3 flex items-center">
                <svg class="w-6 h-6 mr-2 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                </svg>
                Talent Profile Identified!
            </h2>
            <p id="talent-trait" class="text-lg font-medium text-gray-700 mb-4"></p>
            <p id="matched-sport" class="text-md text-gray-600"></p>
        </div>
    </div>

    <script>
        // 1. Data defining different talents and their matched sports
        const talentMatches = [
            { trait: "Exceptional Explosive Power and Agility", sport: "Basketball (Center/Forward) or Boxing" },
            { trait: "Incredible Endurance and Stamina", sport: "Marathon Running or Cycling" },
            { trait: "Superior Hand-Eye Coordination and Precision", sport: "Baseball (Pitcher) or Archery" },
            { trait: "High Flexibility and Balance", sport: "Gymnastics or Diving" },
            { trait: "Great Vertical Leap and Speed", sport: "Volleyball (Hitter) or High Jump" },
            { trait: "High Tactical Intelligence and Strategy", sport: "Chess or Soccer (Midfielder)" }
        ];

        // 2. Function to select a random talent match
        function generateTalentMatch() {
            // Get a random index from 0 up to the length of the array - 1
            const randomIndex = Math.floor(Math.random() * talentMatches.length);
            const matchedProfile = talentMatches[randomIndex];
            
            // Get the HTML elements
            const resultArea = document.getElementById('result-area');
            const talentTrait = document.getElementById('talent-trait');
            const matchedSport = document.getElementById('matched-sport');

            // 3. Update the content and show the result area
            talentTrait.textContent = `Talent Trait: ${matchedProfile.trait}.`;
            matchedSport.textContent = `Best Sport Match: ${matchedProfile.sport}.`;
            
            resultArea.classList.remove('hidden'); // Make the result box visible

            // Optional: Provide a small visual feedback on the button
            const button = document.getElementById('scout-button');
            button.textContent = "Scout Another Talent";
        }
    </script>
</body>
</html>
