<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title><?php echo $title; ?></title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<div style="width: 680px;">
  <?php if ($logo): ?>
  <a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;"/></a>
  <?php endif; ?>
  <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $data['sentEmailTitle']; ?></p>
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
    <tr>
      <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $data['sentEmailField']; ?></td>
      <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $data['sentEmailValue']; ?></td>
    </tr>
    </thead>
    <tbody>
    <?php foreach ($data['items'] as $item): ?>
      <tr>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><b><?php echo $item['label']; ?>:</b></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;">
          <?php if ($item['type'] === 'file'): ?>
            <a href="<?php echo $item['url']; ?>"><?php echo $item['value']; ?></a>
          <?php else: ?>
            <?php echo !is_scalar($item['value']) ? implode(' ', $item['value']) : $item['value']; ?>
          <?php endif; ?>
        </td>
      </tr>
    <?php endforeach; ?>
    </tbody>
  </table>
  <?php if (isset($data['title']) && $data['title']): ?>
  <p style="margin-top: 10px; margin-bottom: 20px;"><?php echo $data['sentEmailUsingModule']; ?> <b><?php echo $data['title']; ?></b></p>
  <?php endif; ?>
  <?php if (isset($data['url']) && $data['url']): ?>
  <p style="margin-top: 10px; margin-bottom: 20px;"><?php echo $data['sentEmailFrom']; ?> <a href="<?php echo $data['url']; ?>"><?php echo $data['url']; ?></a></p>
  <?php endif; ?>
  <?php if (isset($data['ip']) && $data['ip']): ?>
    <p style="margin-top: 10px; margin-bottom: 20px;"><?php echo $data['sentEmailIPAddress']; ?> <b><?php echo $data['ip']; ?></b></p>
  <?php endif; ?>
</div>
</body>
</html>
