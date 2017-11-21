<h1><strong>data_science</strong></h1>

<p><h2><strong>To clone forked or new repository:</strong></h1></p>
<p>
*You have to be on the desired directory within your file system in order to clone the repo where you want it. You can do this using the cd command (change directory) on your terminal (on Mac) or Git Bash (on Windows) to switch to a desired  directory if it is  immediately within or “before” the directory you are working on*
</p>

<p>git clone [URL]</p>

<p><h2><strong>To upload files (and to avoid merging):</strong></h1></p>
<ol>
<li>Add new files in local repository (using Windows Explorer on Windows and Finder on Mac)</li>
<li>Sync local with cloud repo: git pull -a</li>
<li>Add all changed files to local repo: git add .</li>
<li>Commit changes and say what you changed: git commit -m “[say what you added/removed/modified]”</li>
<li>Push committed changes onto online repo: git push</li>
</ol>

<p><h2><strong>To remove files <it>only</it> on the online repo:</strong></h1></p>
<ol>
<li>Sync local with online repo: git pull -a</li>
<li>Add files: git add .</li>
<li>Remove file: git rm --cached [file name]</li>
<li>Commit change: git commit -m "remove [file name]"</li>
<li>Push changes: git push</li>
</ol>

<p><h2><strong>To remove files in both the online and the local repositories (almost same as above but without “--cached” phrase on Step 3):</strong></h1></p>
<ol>
<li>Sync local with online repo: git pull -a</li>
<li>Add files: git add .</li>
<li>Remove file: git rm [file name]</li>
<li>Commit change: git commit -m "remove [file name]"</li>
<li>Push changes: git push</li>
</ol>