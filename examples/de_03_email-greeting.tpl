{* capture fields from contact *}
{capture assign=contact_type}{$contact.contact_type}{/capture}
{capture assign=communication_style}{$contact.communication_style_id}{/capture}
{capture assign=email_greeting}{$contact.email_greeting_custom}{/capture}
{capture assign=display_name}{$contact.display_name}{/capture}
{if $contact_type == 'Individual'}
    {capture assign=first_name}{$contact.first_name}{/capture}
    {capture assign=last_name}{$contact.last_name}{/capture}
    {capture assign=gender}{$contact.gender_id}{/capture}

    {* possible values of field gender *}
    {assign var='female' value=1}
    {assign var='male' value=2}
    {assign var='neutral' value=3}

    {* default value of field gender, if empty *}
    {if !$gender}
        {assign var='gender' value=$neutral}
    {/if}
{elseif $contact_type == 'Household'}
    {capture assign=household_name}{$contact.household_name}{/capture}
{elseif $contact_type == 'Organization'}
    {capture assign=organization_name}{$contact.organization_name}{/capture}
    {capture assign=legal_name}{$contact.legal_name}{/capture}
{/if}

{* possible values of field communication_style *}
{assign var='formal' value=1}
{assign var='familiar' value=2}

{* default value of field communication_style, if empty *}
{if !$communication_style}
    {assign var='communication_style' value=$formal}
{/if}

{* Prefer individually configured greeting, if existent *}
{if $email_greeting}
    {$email_greeting}

{* Household *}
{elseif $contact_type == 'Household'}
    {assign var='household_name_trunc' value=$household_name|truncate:7:"":true}
    {if ($household_name_trunc == 'Familie')}
        Liebe {$household_name}
    {else}
        Hallo {$household_name}
    {/if}

{* Organization *}
{elseif $contact_type == 'Organization'}
    Sehr geehrte Damen und Herren

{* Individual with full name (first and last name) *}
{elseif ($contact_type == 'Individual') && $first_name && $last_name}
    {if ($communication_style == $formal) && ($gender == $female)}
        Liebe {$first_name} {$last_name}

    {elseif ($communication_style == $formal) && ($gender == $male)}
        Lieber {$first_name} {$last_name}

    {elseif ($communication_style == $formal) && ($gender == $neutral)}
        Hallo {$first_name} {$last_name}

    {elseif ($communication_style == $familiar) && ($gender == $female)}
        Liebe {$first_name} {$last_name}

    {elseif ($communication_style == $familiar) && ($gender == $male)}
        Lieber {$first_name} {$last_name}

    {elseif ($communication_style == $familiar) && ($gender == $neutral)}
        Hallo {$first_name} {$last_name}

    {* should not happen *}
    {else}
        Hallo
    {/if}

{* Individual without first name *}
{elseif ($contact_type == 'Individual') && !$first_name && $last_name}
    {if ($communication_style == $formal) && ($gender == $female)}
        Liebe Frau {$last_name}

    {elseif ($communication_style == $formal) && ($gender == $male)}
        Lieber Herr {$last_name}

    {elseif ($communication_style == $formal) && ($gender == $neutral)}
        Hallo

    {elseif ($communication_style == $familiar) && ($gender == $female)}
        Liebe Frau {$last_name}

    {elseif ($communication_style == $familiar) && ($gender == $male)}
        Lieber Herr {$last_name}

    {elseif ($communication_style == $familiar) && ($gender == $neutral)}
        Hallo

    {* should not happen *}
    {else}
        Hallo
    {/if}

{* Individual without last name *}
{elseif ($contact_type == 'Individual') && $first_name && !$last_name}
    {if ($communication_style == $formal) && ($gender == $female)}
        Liebe {$first_name}

    {elseif ($communication_style == $formal) && ($gender == $male)}
        Lieber {$first_name}

    {elseif ($communication_style == $formal) && ($gender == $neutral)}
        Hallo {$first_name}

    {elseif ($communication_style == $familiar) && ($gender == $female)}
        Liebe {$first_name}

    {elseif ($communication_style == $familiar) && ($gender == $male)}
        Lieber {$first_name}

    {elseif ($communication_style == $familiar) && ($gender == $neutral)}
        Hallo {$first_name}

    {* should not happen *}
    {else}
        Hallo
    {/if}

{* Individual without first name and without last name *}
{elseif ($contact_type == 'Individual') && !$first_name && !$last_name}
    {if ($communication_style == $formal) && ($gender == $female)}
        Hallo

    {elseif ($communication_style == $formal) && ($gender == $male)}
        Hallo

    {elseif ($communication_style == $formal) && ($gender == $neutral)}
        Hallo

    {elseif ($communication_style == $familiar) && ($gender == $female)}
        Hallo

    {elseif ($communication_style == $familiar) && ($gender == $male)}
        Hallo

    {elseif ($communication_style == $familiar) && ($gender == $neutral)}
        Hallo

    {* should not happen *}
    {else}
        Hallo
    {/if}

{* should not happen *}
{else}
    Hallo
{/if}
