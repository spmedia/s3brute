# s3brute
Quickly check a list of keywords against every AWS S3 region.

<h2>Usage:</h2>
ruby s3brute.rb wordlist.txt
<img src="https://i.imgur.com/NwN3d30.png">

<h2>Bucket Naming Requirements</h2>
These are the restrictions Amazon puts on s3 bucket names. Make sure your keyword list comforms to these standards before attempting to run a brute force against. This will save you a lot of time.

- Bucket names must be at least 3 and no more than 63 characters long.
- Bucket names must be a series of one or more labels. Adjacent labels are separated by a single period (.). Bucket names can contain lowercase letters, numbers, and hyphens. Each label must start and end with a lowercase letter or a number.
- Bucket names must not be formatted as an IP address (e.g., 192.168.5.4).

<a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html">Read more about S3 bucket naming conventions</a>

<h2>Plans:</h2>
I'll be adding random strings and number generation as well as keyword prepending.

<h2>Credits:</h2>
Much of s3brute's source was based or found directly in <a href="https://github.com/FishermansEnemy/bucket_finder">FishermanEnemy's Project Bucket_Finder</a>
