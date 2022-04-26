import { aws_s3, CfnOutput } from 'aws-cdk-lib';
import { Construct } from 'constructs';

export class Test extends Construct {
  constructor(scope: Construct, id: string) {
    super(scope, id);

    const bucket = new aws_s3.Bucket(this, 'Bucket');
    new CfnOutput(this, `arn`, { value: bucket.bucketArn });
  }
}
