<h1><strong>data_science</strong></h1>

<p><h2><strong>To clone forked or new repository:</strong></h1></p>
<p>
*The command below clones the forked or new online repository directly on the directory specified by the pwd command output. To change to a desired directory where you want to clone the repository, use the cd command (change directory) on your terminal (on Mac) or Git Bash (on Windows) to switch to a desired  directory if it is immediately above or below in the hierarchy of the directory you are working on. Otherwise, you need to specify the full path of the directory you want to "cd" to.*
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

<p><h2><strong>To remove files <em>only</em> on the online repo:</strong></h1></p>
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