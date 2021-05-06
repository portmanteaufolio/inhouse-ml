## Launch AI Platform Notebooks

To launch AI Platform Notebooks:

**Step 1**

Click on the **Navigation Menu**. Navigate to **AI Platform**, then to **Notebooks**.

![Open new notebook](README.assets/sj5Z8NGCDyDO08JggmOSLqr6zaxa6KYiNrQ9QNIrr1Y=)

**Step 2**

On the Notebook instances page, click ![NEW INSTANCE](README.assets/YI0InqyQhTRNsEIGzrufyXjMtsdrwKwspeNXtPlPPeY=). Select the latest version of TensorFlow Enterprise `2.x` *Without GPUs*.

![New instance, TensorFlow 2.x](README.assets/rGGbFaVnsgDMNHZ4=)

In the pop-up, confirm the name of the deep learning VM, move to the bottom of the window and click **Create**.

![Create new VM](README.assets/sfQAlN5skhuPoZuLrVmX4Dva6hA8qKA2zPULKpeO7Uw=)

The new VM will take 2-3 minutes to start.

**Step 3**

Click **Open JupyterLab**. A JupyterLab window will open in a new tab.

![JupyterLab](README.assets/FizD9QIJ5cX401SaSfXqnE=)

## Clone Course Repo within your AI Platform Notebooks Instance

To clone the `training-data-analyst` notebook in your JupyterLab instance:

**Step 1**

In JupyterLab, click the **Terminal** icon to open a new terminal.

![Open Terminal](README.assets/QrA9s=)

**Step 2**

At the command-line prompt, type in the following command and press **Enter**.

```bash
git clone https://github.com/GoogleCloudPlatform/training-data-analystcontent_copy
```

**Step 3**

Confirm that you have cloned the repository by double clicking on the `training-data-analyst` directory and ensuring that you can see its contents. The files for all the Jupyter notebook-based labs throughout this course are available in this directory.

![Training data analyst repository](README.assets/MQ6B0Lqw6lZfTGmlUilfeYl4smBjrzDRUKIVRZRMR00=)

## ARIMA Model for AAPL Closing Price

**Step 1**

In the notebook interface, navigate to **training-data-analyst > courses > ai-for-finance > solution** and open **arima_model.ipynb**.

**Step 2**

Ensure you're using the Python 3 kernel by selecting `Python 3` from the upper right corner of the notebook.

![Python 3](README.assets/ek=)

**Step 3**

In the notebook interface, click on **Edit > Clear All Outputs** (click on Edit, then in the drop-down menu, select Clear All Outputs).

Now read the narrative and execute each cell in turn.