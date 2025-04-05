<?php
namespace App\Service;

use Dompdf\Dompdf;
use Dompdf\Options;
use Symfony\Component\HttpFoundation\Response;

class DompdfService
{
    public function generatePdf($html, string $filename = 'document.pdf', $download = false): Response
    {
        // Configure Dompdf selon vos besoins
        $options = new Options();
        $options->set('defaultFont', 'DejaVu Sans');
        $dompdf = new Dompdf($options);
        
        // Charger le contenu HTML
        $dompdf->loadHtml($html);
        
        // (Optionnel) Configurer le format et l'orientation
        $dompdf->setPaper('A4', 'portrait');
        
        // Rendre le document
        $dompdf->render();
        
        // Options d'en-tête HTTP pour le téléchargement
        $output = $dompdf->output();
        $response = new Response($output);
        
        // Choisissez le type de contenu et le nom de fichier en fonction de $download
        $disposition = $download ? 'attachment' : 'inline';
        $response->headers->set('Content-Type', 'application/pdf');
        $response->headers->set('Content-Disposition', "$disposition; filename=$filename");
        
        return $response;
    }
}
