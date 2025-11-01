echo This file is going to help us to track our expensess and also to manage our budget
Date
echo thanks to eng Digi Daktari
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Budget Management Tool</title>
    <link href=
"https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" 
          rel="stylesheet">
</head>

<body class="bg-gray-100">
    <div class="flex flex-col items-center 
                justify-center min-h-screen">
        <div class="bg-white p-8 rounded-lg 
                    shadow-lg max-w-md w-full">
            <h2 class="text-2xl font-semibold 
                       text-gray-800 mb-4">
                Budget Management Tool
            </h2>
            <form id="budgetForm">
                <label for="income" class="text-gray-700">
                    Income:
                </label>
                <input type="number" 
                       id="income" 
                       name="income" 
                       class="w-full border border-green-500
                              rounded-lg p-2 mb-4">
                <label for="expenseAmount" class="text-gray-700">
                    Expense Amount:
                </label>
                <input type="number" 
                       id="expenseAmount" 
                       name="expenseAmount" 
                       class="w-full border border-green-500
                              rounded-lg p-2 mb-4">
                <label for="expenseCategory" class="text-gray-700">
                    Expense Category:
                </label>
                <select id="expenseCategory" 
                        name="expenseCategory" 
                        class="w-full border border-green-500
                               rounded-lg p-2 mb-4">
                    <option value="Groceries">Groceries</option>
                    <option value="Utilities">Utilities</option>
                    <option value="Transportation">
                        Transportation
                    </option>
                    <option value="Entertainment">
                        Entertainment
                    </option>
                </select>
                <button type="button" 
                        id="addExpense" 
                        class="bg-blue-500 hover:bg-blue-600 
                               text-white rounded-lg px-4 py-2 
                               w-full mb-4">
                    Add Expense
                </button>
                <div id="expenseList" class="mb-4"></div>
                <div class="flex justify-between items-center mb-4">
                    <span class="text-gray-700">
                        Total Expenses:
                    </span>
                    <span id="totalExpenses" 
                          class="text-green-600 font-semibold">
                    </span>
                </div>
                <button type="submit" 
                        class="bg-green-500 hover:bg-green-600
                               text-white rounded-lg px-4 py-2 
                               w-full">
                    Calculate
                </button>
            </form>
            <div id="savings" class="mt-4 text-gray-700"></div>
        </div>
    </div>
    <script>
        let expenses = [];
        document.getElementById('addExpense')
            .addEventListener('click', function () {
                const expenseAmount = parseFloat(document
                    .getElementById('expenseAmount')
                    .value);
                const expenseCategory = document
                    .getElementById('expenseCategory')
                    .value;
                if (!isNaN(expenseAmount) && expenseCategory) {
                    expenses.push({
                        amount: expenseAmount,
                        category: expenseCategory
                    });
                    renderExpenseList();
                } else {
                    alert(`Please enter a valid expense 
                              amount and select a category.`);
                }
            });
        function renderExpenseList() {
            const expenseListElement = document.getElementById('expenseList');
            expenseListElement.innerHTML = '';
            let totalExpenses = 0;
            expenses.forEach(expense => {
                const expenseItem = document.createElement('div');
                expenseItem.textContent = `${expense.category}: 
                $${expense.amount.toFixed(2)}`;
                expenseListElement.appendChild(expenseItem);
                totalExpenses += expense.amount;
            });
            document.getElementById('totalExpenses')
                .textContent = `$${totalExpenses.toFixed(2)}`;
        }
        document.getElementById('budgetForm')
            .addEventListener('submit', function (event) {
                event.preventDefault();
                const income = parseFloat(document.getElementById('income')
                    .value);
                const totalExpenses = expenses.reduce((acc, expense) =>
                    acc + expense.amount, 0);
                if (!isNaN(income)) {
                    const savings = income - totalExpenses;
                    document.getElementById('savings')
                        .textContent = `Savings: $${savings.toFixed(2)}`;
                } else {
                    document.getElementById('savings')
                        .textContent = "Please enter a valid income amount.";
                }
            });
    </script>
</body>

</html>
