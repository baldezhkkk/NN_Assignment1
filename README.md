This is MATLAB laboratory assignment focused on implementing and training single-layer perceptrons using the Neural Network Toolbox.

---

# Neural Network Classification: Single-Layer Perceptrons

This project demonstrates the application of single-layer perceptrons to solve various classification problems, ranging from simple 2D binary classification to multi-neuron complex region separation.

## 🚀 Project Structure

The repository contains five MATLAB scripts, each addressing a specific classification task:

| File | Task Description | Key Concepts |
| :--- | :--- | :--- |
| `task1_part1.m` | **Simple 2D Binary Classification** | Basic perceptron initialization (`newp`), training (`train`), and visualization (`plotpc`). |
| `task1_part3.m` | **3D Image Classification** | Handling 3-dimensional input vectors and calculating point-to-plane distances. |
| `task1_part5.m` | **4-Class Classification** | Using a multi-neuron layer (2 neurons) to categorize data into four distinct classes. |
| `task2_part1.m` | **Real-world Proxy: Novels vs. Romances** | Data normalization (`learnpn`) and classifying objects based on character count and page length. |
| `task2_part3.m` | **Complex Geometric Selection** | Using 3 neurons to create a "convex hull" effect to isolate a central group from surrounding "guard" points. |

---

## 🛠 Features

### 1. Geometric Logic
In `task2_part3.m`, the network is trained to recognize a central cluster.
* **Logic:** A point is classified as "Black" (Central) only if **all three neurons** output a `1`.
* **Visualization:** The script plots decision boundaries and tests new coordinates, marking them as green squares (success) or red crosses (fail).


### 2. Distance Analysis
In `task1_part3.m`, the code doesn't just classify; it performs a geometric audit:
* It extracts weights ($W$) and bias ($b$) from the trained network.
* It calculates the Euclidean distance from the input points to the separating hyperplane using the formula:
$$d = \frac{|W \cdot x + b|}{\|W\|}$$

### 3. Normalization
`task2_part1.m` demonstrates why feature scaling matters. Since "number of characters" (e.g., 5) and "number of pages" (e.g., 500) have different magnitudes, the script uses `learnpn` and manual normalization to ensure stable convergence.

---

## 💻 How to Use

1.  **Prerequisites:** Ensure you have MATLAB installed with the **Deep Learning Toolbox** (formerly Neural Network Toolbox).
2.  **Execution:** * Open MATLAB.
    * Navigate to the directory containing the files.
    * Run any script (e.g., `task2_part3`) by typing its name in the Command Window.
3.  **Outputs:**
    * The **Command Window** will display the number of errors and classification results for test points.
    * A **Figure Window** will appear showing the data points and the linear decision boundaries calculated by the perceptron.

---

## 📊 Visualization Examples

The scripts use MATLAB's built-in neural network plotting tools:
* `plotpv(X, T)`: Plots input vectors with different markers for different classes.
* `plotpc(W, b)`: Draws the classification line (or plane) defined by the weights and bias.
